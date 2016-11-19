require 'rails_helper'

RSpec.describe Dashboard::CompaniesController do

  let!(:company1) { FactoryGirl.create(:company) }
  let!(:company2) { FactoryGirl.create(:company) }
  let!(:invalid_id) { FactoryGirl.create(:company_id_invalid) }

  context "Happy Path" do
    before(:each) do
      login_user
      Account.first == nil ? controller.current_user.account = FactoryGirl.create(:account) : controller.current_user.account = Account.first
    end

    describe "user signed in" do
      it_behaves_like("login render"){ before(:each) { get :index } }
      it_behaves_like("login render"){ before(:each) { get :show, { id: company1.id } } }
      it_behaves_like("login render"){ before(:each) do
        get :new
      end }
      it_behaves_like("login render"){ before(:each) { get :edit, {id: company1.id} } }
      it_behaves_like("login redirect"){ before(:each) do
        post :create, company: { id: company1.id  }
      end }
      it_behaves_like("login redirect"){ before(:each) { put :update, id: company1.id } }
      it_behaves_like("login redirect"){ before do
        controller.current_user.account.companies << company1 << company1
        delete :destroy, id: company1.id
      end }
    end

    describe "GET index" do
      before { get :index }

      it "assigns all user's companies to @companies" do
        controller.current_user.account.companies << company1 << company2
        expect(assigns(:companies)).to eq( controller.current_user.account.companies )
      end
      it { expect(assigns(:companies)).to eq( [] ) }
    end

    describe "GET show" do
      before(:each) { get :show, {:id => company1.id} }

      it { expect(assigns(:company)).to eq(company1) }
    end

    describe "GET new" do
      describe "current_user.account.companies is empty" do
        before do
          controller.current_user.account.companies.each( &:destroy )
          get :new
        end

        it { expect( assigns( :companies ) ).to eq( [ company1, company2, invalid_id ] ) }
        it { expect( assigns(:company) ).to eq( company1 ) }
        it { expect( response.status ).to be( 200 )}
      end
      describe "current_user.account.companies size is 1" do
        before do
          controller.current_user.account.companies.each( &:destroy )
          controller.current_user.account.companies << company1
          get :new
        end

        it { expect( assigns( :companies ) ).to eq( [ company1, company2, invalid_id ] ) }
        it { expect( assigns(:company) ).to eq( company1 ) }
        it { expect( response.status ).to be( 302 )}
      end
      describe "current_user.account.companies size is 2" do
        before do
          controller.current_user.account.companies.each( &:destroy )
          controller.current_user.account.companies << company1 << company2
          get :new
        end

        it { expect( assigns( :companies ) ).to eq( [ company1, company2, invalid_id ] ) }
        it { expect( assigns(:company) ).to eq( company2 ) }
        it { expect( response.status ).to be( 302 )}
      end
    end

    describe "GET edit" do
      before(:each) { get :edit, { :id => company1.id } }

      it { expect( assigns(:company) ).to eq( company1 ) }
    end

    describe "POST create" do
      before(:each) { post :create, company: { id: company1.id } }

      it { expect( assigns(:company) ).to eq( company1 ) }
      it { expect{ controller.current_user.account.companies <<  company1 }.to change( controller.current_user.account.companies, :count ).by( 1 ) }
      it { expect( controller.current_user.account.companies ).to include( company1 ) }
      it { expect( response ).to redirect_to( root_url ) }
    end

    describe "PUT update" do
      before { put :update, id: company1.id }

      it { expect( assigns(:company) ).to eq( company1 ) }
      it { expect( company1.accounts ).to include( controller.current_user.account ) }
      it { expect( company1.accounts ).to include( controller.current_user.account ) }
    end

    describe "DELETE destroy" do
      before { delete :destroy, id: company1.id }

      it { expect( company1.accounts ).not_to include( controller.current_user ) }
      it { expect( response ).to redirect_to( root_url ) }
    end
  end


  context "Unhappy path" do
    describe "User not signed in" do
      it_behaves_like("not login redirect"){ before(:each) { get :index } }
      it_behaves_like("not login redirect"){ before(:each) { get :show, { id: company1.id } } }
      it_behaves_like("not login redirect"){ before(:each) { get :new } }
      it_behaves_like("not login redirect"){ before(:each) { get :edit, {id: company1.id} } }
      it_behaves_like("not login redirect"){ before(:each) { post :create, site: { id: company1.id  } } }
      it_behaves_like("not login redirect"){ before(:each) { put :update, id: company1.id } }
      it_behaves_like("not login redirect"){ before(:each) { delete :destroy, id: company1.id } }
    end

    context "user signed in" do
      before(:each) do
        login_user
        Account.first == nil ? controller.current_user.account = FactoryGirl.create(:account) : controller.current_user.account = Account.first
      end

      describe "GET new" do
        describe "current_user.account.companies is not empty" do
          before do
            controller.current_user.account.companies << company1 << company2
            get :new
          end
          it { expect( assigns(:company) ).to eq( company2 ) }
          it { expect( response.status ).to be( 302 )}
        end
      end

      #describe "Invalid params" do
        #before(:each) { login_user }

        #describe "PUT update" do
          #subject { put :update, id: invalid_id }
          #before(:each) {subject}

          #it { expect( invalid_id.accounts ).not_to include(controller.current_user.account) }
          #it { expect(assigns(:company)).not_to eq(company1) }
          #it { expect(response).to render_template("new") }
          #it { expect(:notice).to be_present }
          #it { expect(:notice).not_to be_nil }
        #end
      #end

    end
  end

end

require 'rails_helper'

RSpec.describe Dashboard::SitesController do

  let!(:site1) { FactoryGirl.create(:site) }
  let!(:site2) { FactoryGirl.create(:site) }
  let!(:company1) { FactoryGirl.create(:company) }

  context "happy path" do
    before(:each) do
      login_user
      Account.first == nil ? controller.current_user.account = FactoryGirl.create(:account) : controller.current_user.account = Account.first
    end

    describe "user signed in" do
      it_behaves_like("login render"){ before(:each) { get :index } }
      it_behaves_like("login render"){ before(:each) { get :show, { id: site1.id } } }
      it_behaves_like("login render"){ before(:each) do
        controller.current_user.account.companies << company1
        controller.current_user.account.sites << site1 << site2
        get :new
      end }
      it_behaves_like("login render"){ before(:each) { get :edit, {id: site1.id} } }
      it_behaves_like("login redirect"){ before(:each) do
        site1.companies << company1
        post :create, site: { id: site1.id  }
      end }
      it_behaves_like("login render"){ before(:each) { put :update, id: site1.id } }
      it_behaves_like("login redirect"){ before do
        controller.current_user.account.sites << site1 << site2
        delete :destroy, id: site1.id
      end }
    end

    describe "GET index" do
      before { get :index }

      it "assigns all user sites as @sites" do
        controller.current_user.account.sites << site1 << site2
        expect( assigns(:sites) ).to eq( controller.current_user.account.sites )
        expect( assigns(:sites) ).to eq( [site1, site2] )
      end
      it { expect( assigns(:sites) ).to eq( [] ) }
    end


    describe "GET show" do
      before { get :show, {id: site1.id} }

      context "happy" do
        it { expect( assigns(:site) ).to eq( site1 ) }
      end
    end

    describe "GET new" do

      describe "company has 1 site, account has 0 company, account has 0 sites" do
        before {
          company1.sites << site1
          get :new
        }

        it { expect( response.status ).to be( 302 )}
        it { expect( response ).to redirect_to( new_dashboard_company_url ) }
      end

      describe "company has 1 site, account has 1 company, account has 0 sites" do
        before {
          company1.sites << site1
          controller.current_user.account.companies << company1
          get :new
        }

        it { expect( assigns( :companies_sites ) ).to eq( [ [ company1, nil ] ] ) }
        it { expect( assigns( :current_company ) ).to eq( company1 ) }
        it { expect( assigns( :current_company_sites ) ).to eq( [ site1 ] ) }
      end

      describe "company has 1 site, account has 1 company, account has 2 sites" do
        before {
          controller.current_user.account.companies << company1
          controller.current_user.account.sites << site1 << site2
          get :new
        }
        it { expect( assigns(:company) ).to eq( company1 ) }
        it { expect( assigns(:sites) ).to eq( controller.current_user.account.sites ) }
        it { expect( assigns(:site) ).to eq( controller.current_user.account.sites.last ) }
        it { expect( assigns(:site) ).to eq( site2 ) }
      end
    end

    describe "GET edit" do
      before { get :edit, {id: site1.id} }

      it { expect(assigns(:site)).to eq(site1) }
      it { expect(assigns(:site)).to_not eq(site2) }
      it "assigns all users sites as @sites" do
        controller.current_user.account.sites << site1 << site2
        expect( assigns(:sites) ).to eq( controller.current_user.account.sites )
      end
    end

    describe "POST create" do
      before do
        site1.companies << company1
        post :create, site: { id: site1.id }
      end

      it{ expect( assigns(:site) ).to eq(site1) }
      it{ expect{ controller.current_user.account.sites << site1 }.to change(controller.current_user.account.sites, :count).by(1) }
      it{ expect( response ).to redirect_to root_path }
    end

    describe "PUT update" do
      before{ put :update, id: site1.id }

      it{ expect( assigns(:site) ).to eq(site1) }
      it{ expect{ controller.current_user.account.sites << site1 }.to change( controller.current_user.account.sites, :count ).by( 1 ) }
      it{ expect( response ).to render_template root_path }
    end

    describe "DELETE destroy" do
      before do
        controller.current_user.account.sites << site1 << site2
        delete :destroy, id: site1.id
      end

      it { expect( controller.current_user.account.sites ).not_to include( site1 ) }
      it { expect( response ).to redirect_to( root_path ) }
    end

  end

  context "unhappy path" do

    describe "user not signed in" do
      it_behaves_like("not login redirect"){ before(:each) { get :index } }
      it_behaves_like("not login redirect"){ before(:each) { get :show, { :id => site1.to_param } } }
      it_behaves_like("not login redirect"){ before(:each) { get :new } }
      it_behaves_like("not login redirect"){ before(:each) { get :edit, {id: site1.to_param} } }
      it_behaves_like("not login redirect"){ before(:each) { post :create, site: { id: site1.id  } } }
      it_behaves_like("not login redirect"){ before(:each) { put :update, id: site1.id } }
      it_behaves_like("not login redirect"){ before(:each) { delete :destroy, id: site1.to_param } }
    end

    describe "user logged in" do
      before do
        login_user
        Account.first == nil ? controller.current_user.account = FactoryGirl.create(:account) : controller.current_user.account = Account.first
      end

      describe "GET new" do

        describe "invalid params" do
          before do
            controller.current_user.account.companies.each( &:destroy )
            get :new
          end
          it { expect( response ).to redirect_to new_dashboard_company_url }
        end

      end

      #describe "POST create" do
        #subject {
          #site1.companies << company1
          #post :create, site: { id: site1.id }
        #}
        #before{ subject }

        #describe "with invalid params" do
          #it "redirects to new when site isn't found" do
            #Site.stub(:name).and_return(false)
            #expect( response ).to render_template(:new)
          #end
        #end
      #end

      describe "PUT update" do

        describe "with invalid params" do
          before do
            controller.current_user.account.sites.delete( site1 )
            controller.current_user.account.sites.delete( site2 )
            put :update, id: site1.id
          end

          it{ expect( response ).to render_template :new }
        end
      end

    end
  end

end

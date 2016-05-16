require 'rails_helper'

RSpec.describe Dashboard::CompaniesController do

  let!(:company1) { FactoryGirl.create(:company) }
  let!(:company2) { FactoryGirl.create(:company) }
  let!(:invalid_id) { FactoryGirl.create(:company_id_invalid) }

  context "Happy Path" do
    describe "User signed in" do
      before(:each) {
        login_user
        Account.first == nil ? controller.current_user.account = FactoryGirl.create(:account) : controller.current_user.account = Account.first
      }

      it { expect(controller.current_user).to_not eq(nil) }
      it { expect(controller.current_user).to eq(controller.current_user) }

      describe "GET index" do
        subject { get :index, {} }
        before(:each) { subject }

        it "assigns all user's companies to @companies" do
          controller.current_user.account.companies << company1 << company2
          expect(assigns(:companies)).to eq( controller.current_user.account.companies )
        end
        it { expect(assigns(:companies)).to eq( [] ) }
      end

      describe "GET show" do
        subject { get :show, {:id => company1.id} }
        before(:each) { subject }

        it { expect(assigns(:company)).to eq(company1) }
      end

      #describe "GET new" do
        #subject { get :new }
        #before(:each) { subject }

        #it "redirects to edit if current_user has at least one company listed" do
          #controller.current_user.account.companies << company1 << company2
          #expect(controller.current_user.account.companies).to redirect_to(edit_dashboard_company_url(company2))
        #end

        #it "assigns all companies to @companies" do
          #controller.current_user.account.companies << company1 << company2
          #expect(assigns(:companies)).to eq(controller.current_user.account.companies)
        #end

      #end

      describe "GET edit" do
        subject { get :edit, {:id => company1.id} }
        before(:each) { subject }

        it { expect(assigns(:company)).to eq(company1) }
      end

      describe "POST create" do
        describe "with valid params" do
          subject {post :create, company: {id: company1.id}}
          before(:each) { subject }

          it { expect(assigns(:company)).to eq(company1) }
          it { expect( company1.accounts ).to include(controller.current_user.account) }
          it "increases current_user.account.companies count by 1" do
            expect{
              company1.accounts << controller.current_user.account
              assigns(:company)
            }.to change( controller.current_user.account.companies, :count ).by(1)
          end
          it "increases @company.clients count by 1" do
            expect{
              company1.accounts << controller.current_user.account
              assigns(:company)
            }.to change( company1.accounts, :count ).by(1)
          end
          it { expect(response).to redirect_to(root_url) }
        end
      end

      describe "PUT update" do
        describe "with valid params" do
          subject {put :update, id: company1.id}
          before(:each) do
            subject
            expect(assigns(:company)).to eq(company1)
          end

          it "resets current company for current_user" do
            company1.accounts << controller.current_user.account
            company1.accounts.delete controller.current_user.account
            company1.accounts << controller.current_user.account
            expect( company1.accounts ).to include(controller.current_user.account)
          end
          it "sets current company for current_user" do
            company1.accounts << controller.current_user.account
            expect( company1.accounts ).to include(controller.current_user.account)
          end
        end
      end

      describe "DELETE destroy" do
        subject {delete :destroy, id: company1.id}
        before(:each) { subject }

        it { expect(company1.accounts).not_to include(controller.current_user) }
        it { expect(response).to redirect_to(root_url) }
      end
    end
  end


  context "Unhappy path" do
    describe "User not signed in" do
       describe "GET index" do
        subject { get :index }
        before(:each) { subject }

        it {expect(response.status).to eql(302)}
        it {expect(response).to_not be_successful}
        it {expect(response).to redirect_to(new_user_session_path)}
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

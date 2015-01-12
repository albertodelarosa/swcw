require 'spec_helper'

describe Dashboard::CompaniesController do

  let!(:company1) { FactoryGirl.create(:company) }
  let!(:company2) { FactoryGirl.create(:company) }
  let!(:invalid_id) { FactoryGirl.create(:company_id_invalid) }

  context "Happy Path" do
    describe "User signed in" do
      before(:each) { register_user }

      describe "GET index" do
        subject { get :index }
        before(:each) { subject }

        it "assigns all user's companies to @companies" do
          @user.companies << company1 << company2
          expect(assigns(:companies)).to eq( @user.companies )
        end
        it { expect(assigns(:companies)).to eq( [] ) }
      end

      describe "GET show" do
        subject { get :show, {:id => company1.id} }
        before(:each) { subject }

        it { expect(assigns(:company)).to eq(company1) }
      end

      describe "GET new" do
        subject { get :new }
        before(:each) { subject }

        it { expect(assigns(:company)).to be_a_new(Company) }
        it "assigns all companies to @companies" do
          @user.companies << company1 << company2
          expect(assigns(:companies)).to eq(@user.companies)
        end
      end

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
          it { expect( company1.clients ).to include(@user) }
          it "increases @user.companies count by 1" do
            expect{
              company1.clients << @user
              assigns(:company)
            }.to change( @user.companies, :count ).by(1)
          end
          it "increases @company.clients count by 1" do
            expect{
              company1.clients << @user
              assigns(:company)
            }.to change( company1.clients, :count ).by(1)
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

          it "removes company from current_user.companies" do
            company1.clients << @user
            company1.clients.delete @user
            expect( company1.clients ).not_to include(@user)
          end
        end
      end

      describe "DELETE destroy" do
        subject {delete :destroy, id: company1.id}
        before(:each) { subject }

        it { expect(company1.clients).not_to include(@user) }
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

    describe "Invalid params" do
      before(:each) { register_user }

      describe "PUT update" do
        subject { put :update, id: invalid_id }
        before(:each) { subject }

        it { expect( invalid_id.clients ).not_to include(@user) }
        it { expect(assigns(:company)).not_to eq(company1) }
        it { expect(response).to render_template("new") }
        it { expect(:notice).to be_present }
        it { expect(:notice).not_to be_nil }
      end

    end
  end

end

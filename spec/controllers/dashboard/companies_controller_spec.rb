require 'spec_helper'

describe Dashboard::CompaniesController do

  let!(:company1) { FactoryGirl.create(:company) }
  let!(:company2) { FactoryGirl.create(:company) }

  describe "User not signed in" do
     describe "GET index" do 
      subject { get :index }
      before(:each) { subject }

      it {response.status.should == 302}
      it {response.should_not be_successful}
      it {expect(response).to redirect_to(new_user_session_path)}
    end
  end

  describe "User signed in" do
    register_user

    describe "GET index" do
      subject { get :index }
      before(:each) { subject }

      it "assigns all user's companies to @companies" do
        @user.companies << company1 << company2
        assigns(:companies).should eq( @user.companies )
      end
      it { assigns(:companies).should eq( [] ) }
    end

    describe "GET show" do
      subject { get :show, {:id => company1.id} }
      before(:each) { subject }

      it { assigns(:company).should eq(company1) }
    end

    describe "GET new" do
      subject { get :new }
      before(:each) { subject }

      it { assigns(:company).should be_a_new(Company) }
      it { assigns(:companies).should eq([company1]) }
    end

    describe "GET edit" do
      subject { get :edit, {:id => company1.id} }
      before(:each) { subject }

      it { assigns(:company).should eq(company1) }
    end

    describe "POST create" do
      describe "with valid params" do
        subject {post :create, company: {id: company1.id}}
        before(:each) { subject }

        it { assigns(:company).should eq(company1) }
        it { expect( company1.clients ).to include(@user) }
        it { response.should redirect_to(root_url) }
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        subject {put :update, id: company1.id}
        before(:each) do
          subject
          assigns(:company).should eq(company1)
        end

        it "removes company from current_user.companies" do
          company1.clients << @user
          company1.clients.delete @user 
          expect( company1.clients ).not_to include(@user)
        end

        it { expect( company1.clients ).to include(@user) }
        it { response.should redirect_to(root_path) }
        it { expect( flash[:notice] ).not_to be_nil }
      end

      #######################  TODO  #######################
      #describe "with invalid params" do
        #before(:each) do
          #@company = FactoryGirl.create(:company)
          #Company.any_instance.stub(:save).and_return(false)
          #put :update, {:id => @company.to_param, :company => {  }}
        #end

        #it { assigns(:company).should eq(@company) }
        #it { response.should render_template("edit") }
      #end

    end

    describe "DELETE destroy" do
      subject {delete :destroy, id: company1.id}
      before(:each) { subject }

      it { expect(company1.clients).not_to include(@user) }
      it { response.should redirect_to(root_url) }
    end

  end

end

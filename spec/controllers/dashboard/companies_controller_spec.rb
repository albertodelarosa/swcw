require 'spec_helper'

describe Dashboard::CompaniesController do

  let!(:test_company) { FactoryGirl.create(:company) }
  register_user

  describe "GET index" do
    subject { get :index }
    before(:each) { subject }

    it { assigns(:companies).should eq([test_company]) }
  end

  describe "GET show" do
    subject { get :show, {:id => test_company.id} }
    before(:each) { subject }

    it { assigns(:company).should eq(test_company) }
  end

  describe "GET new" do
    subject { get :new }
    before(:each) { subject }

    it { assigns(:company).should be_a_new(Company) }
    it { assigns(:companies).should eq([test_company]) }
  end

  describe "GET edit" do
    subject { get :edit, {:id => test_company.id} }
    before(:each) { subject }

    it { assigns(:company).should eq(test_company) }
  end

  describe "POST create" do
    describe "with valid params" do
      subject {post :create, company: {id: test_company.id}}
      before(:each) { subject }

      it { assigns(:company).should eq(test_company) }
      it { expect( test_company.clients ).to include(@user) }
      it { response.should redirect_to(root_url) }
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      subject {put :update, id: test_company.id}
      before(:each) do
        subject
        assigns(:company).should eq(test_company)
      end

      it "removes company from current_user.companies" do
        test_company.clients << @user
        test_company.clients.delete @user 
        expect( test_company.clients ).not_to include(@user)
      end

      it { expect( test_company.clients ).to include(@user) }
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
    subject {delete :destroy, id: test_company.id}
    before(:each) { subject }

    it { expect(test_company.clients).not_to include(@user) }
    it { response.should redirect_to(root_url) }
  end

end

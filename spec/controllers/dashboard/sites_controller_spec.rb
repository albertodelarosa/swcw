require 'rails_helper'

describe Dashboard::SitesController do

  let!(:site1) { FactoryGirl.create(:site) }
  let!(:site2) { FactoryGirl.create(:site) }
  let!(:company1) { FactoryGirl.create(:company) }

  describe "User not signed in" do
     describe "GET index" do
      subject { get :index }
      before(:each) { subject }

      it {expect(response.status).to eq(302)}
      it {expect(response).to_not be_successful}
      it {expect(response).to redirect_to(new_user_session_path)}
    end
 end


  describe "User signed in" do
    before(:each) {
      login_user
      Account.first == nil ? controller.current_user.account = FactoryGirl.create(:account) : controller.current_user.account = Account.first
    }

    describe "GET index" do
      context "happy" do
        subject { get :index }
        before(:each) {subject}

        it "assigns all user sites as @sites" do
          controller.current_user.account.sites << site1 << site2
          expect(assigns(:sites)).to eq(controller.current_user.account.sites)
          expect(assigns(:sites)).to eq([site1, site2])
        end
        it { expect(assigns(:sites)).to eq([]) }
      end
    end


    describe "GET show" do
      subject { get :show, {:id => site1.to_param} }
      before(:each) { subject }

      context "happy" do
        it {expect(assigns(:site)).to eq(site1)}
      end
    end


    describe "GET new" do
      subject { get :new }
      before(:each) { subject }

      #it "current_user must have a company to associate a site"do
      #end
      #it "redirects to edit if user has a site assocaited" do
      #end
      it "assigns all currrent_user's sites to @sites" do
        #sites = Company.last.sites
        company1.sites << site1 << site2
        #controller.current_user.account.companies << company1
        expect(assigns(:sites)).to eq( company1.sites )
      end
    end


    describe "GET edit" do
      subject { get :edit, {id: site1.to_param} }
      before(:each) { subject }
      it { expect(assigns(:site)).to eq(site1) }
      it { expect(assigns(:site)).to_not eq(site2) }
      it "assigns all users sites as @sites" do
        @user.sites << site1 << site2
        expect(assigns(:sites)).to eq( @user.sites )
      end
    end


    describe "POST create" do
      subject { post :create, { site: { id: site1.to_param } } }

      describe "with valid params" do
        it "assign found company to @company" do
          expect( assigns(:company).to eq(site1))
        end
        it{ expect { subject }.to change(@user.sites, :count).by(1) }
        it{ expect(response).to render(root_path) }
      end

      #describe "with invalid params" do
        #it "re-renders the 'new' template" do
          #Site.any_instance.stub(:save).and_return(false)
          #subject
          #expect(response).to render_template("new")
        #end
      #end
    end


    #######################  TODO  #######################
    #describe "PUT update" do
      #describe "with valid params" do
        #subject {put :update, site: {id: site1.id}}
        #before(:each) do
          #subject
          #assigns(:site).should eq(site1)
        #end

        #it "updates the requested site for current_user.sites" do
          #@user.sites << site1
          #assigns(:site).should have(site1)
        #end

        #it "assigns the requested dashboard_site as @dashboard_site" do
          #site = Site.create! valid_attributes
          #put :update, {:id => site.to_param, :site => valid_attributes}, valid_session
          #assigns(:site).should eq(site)
        #end

        #it "redirects to the dashboard_site" do
          #site = Site.create! valid_attributes
          #put :update, {:id => site.to_param, :site => valid_attributes}, valid_session
          #response.should redirect_to(site)
        #end
      #end

      #describe "with invalid params" do
        #it "assigns the dashboard_site as @dashboard_site" do
          #site = Site.create! valid_attributes
          #Site.any_instance.stub(:save).and_return(false)
          #put :update, {:id => site.to_param, :site => {  }}, valid_session
          #assigns(:site).should eq(site)
        #end

        #it "re-renders the 'edit' template" do
          #site = Site.create! valid_attributes
          #Site.any_instance.stub(:save).and_return(false)
          #put :update, {:id => site.to_param, :site => {  }}, valid_session
          #response.should render_template("edit")
        #end
      #end
    #end


    describe "DELETE destroy" do
      subject {delete :destroy, id: site1.to_param}
      before(:each) { subject }

      it { expect( @user.sites ).not_to include( site1 ) }
      it { expect(response).to redirect_to( root_path ) }
    end
  end

end

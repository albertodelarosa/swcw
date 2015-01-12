module ControllerMacros
  def register_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end

  def register_user
#    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      @user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in @user
#    end
  end

  #def shared_find "find from" do |entity|
    #it 'valid params' do
      #entity.stub(:find).with(company: {id: test_company.id}).and_return(test_company)
    #end
  #end
end

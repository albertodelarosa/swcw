module ControllerMacros
  def register_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    @user.confirm # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
    sign_in @user
  end

  #def shared_find "find from" do |entity|
    #it 'valid params' do
      #entity.stub(:find).with(company: {id: test_company.id}).and_return(test_company)
    #end
  #end
end

RSpec.shared_examples "not login redirect" do
  it {expect(response.status).to eq(302)}
  it {expect(response).to_not be_successful}
  it {expect(response).to redirect_to(new_user_session_path)}
end
RSpec.shared_examples "login render" do
  it {expect(response.status).to eq(200)}
  it {expect(response).to be_successful}
end
RSpec.shared_examples "login redirect" do
  it {expect(response.status).to eq(302)}
  it {expect(response).to_not be_successful}
end


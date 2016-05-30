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

  def self.tokenize_symbol(symbols)
    tokenized_symbol = ""
    symbols.to_s.singularize.split("_").each{ |symbol| tokenized_symbol << symbol.capitalize }
    return tokenized_symbol
  end

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

RSpec.shared_examples "it is valid object" do |me, my_attrs|
  my_attrs.each do |method_name, object_values|
    it { expect( me.send( method_name ) ).to be_a_kind_of( object_values[0].constantize ) }
    it { expect( me.send( method_name ) ).to_not be_nil }
    it { expect( me.send( method_name ) ).to eq( object_values[1] ) }
  end
end

RSpec.shared_examples "has_one associations" do |me, associations|
  associations.each{ |method_name, factory| it { expect( me.send method_name ).to be_a_kind_of( factory.class ) } }
end


RSpec.shared_examples "has_many associations" do |me, associations|
  associations.each do |method_name, value|

    key_tokenized = ControllerMacros.tokenize_symbol(method_name)

    unless me.send( method_name ).nil?
      me.send( method_name ) << value
      it { expect( me.send( method_name ) ).to be_a_kind_of( "#{key_tokenized}::ActiveRecord_Associations_CollectionProxy".constantize ) }
      it { expect( me.send( method_name ).first ).to be_a_kind_of( value.class ) }
      it { expect( me.send( method_name ).first ).to eq( value ) }
    end
  end
end

RSpec.shared_examples "it has a missing method" do |me, associations|
  associations.each{ |association| it { expect{ me.send( association ) }.to raise_error( NoMethodError ) } }
end


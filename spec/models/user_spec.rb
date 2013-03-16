require 'spec_helper'

describe User do
  context 'unhappy' do ####################################################################

    context 'when username is somehow incorrect like: ' do 
      it "field not entered then validation fails" do
        expect(User.new).to have(2).error_on(:username)
      end
      it "too short then validation fails" do
        expect(User.new(username: 'steve')).to have(1).error_on(:username)
      end
    end



    context 'when email is somehow incorrect like: ' do 
      it "not entered then should not save" do
        expect(User.new).to have(1).error_on(:email)
      end
      it "no (@) symbol not entered then should not save" do
        expect(User.new(email: 'sfd')).to have(1).error_on(:email)
      end
      it "no (@) symbol not entered before the dot(.) then should not save" do
        expect(User.new(email: 'sfd.com')).to have(1).error_on(:email)
      end
      it "no dot(.) after (@) symbol not entered should not save" do
        expect(User.new(email: 'sfd@sitelerwash')).to have(1).error_on(:email)
      end
      it "too few letters after dot(.) not entered should not save" do
        expect(User.new(email: 'sfd@sitelerwash.i')).to have(1).error_on(:email)
      end
      it "too many letters after dot(.) not entered should not save" do
        expect(User.new(email: 'sfd@sitelerwash.infos')).to have(1).error_on(:email)
      end
      it "digit entered after the dot(.) not entered should not save" do
        expect(User.new(email: 'sfd@sitelerwash.in3s')).to have(1).error_on(:email)
      end
      it "digit entered after the dot(.) not entered should not save" do
        expect(User.new(email: 'sfd@sitelerwash.%ins')).to have(1).error_on(:email)
      end
      it "digit entered after the dot(.) not entered should not save" do
        expect(User.new(email: 'sfd@sitelerwash.inso^')).to have(1).error_on(:email)
      end
    end



    context 'when password is not correct like: ' do 
      it "not entered should not save" do
        expect(User.new).to have(1).error_on(:password)
      end
      it "is too short should not save" do
        expect(User.new(password: 'passw')).to have(1).error_on(:password)
      end
    end

  end





  context 'happy' do ####################################################################

    context 'when username is correct like: ' do
      it "username has minimum length (6) then validation passes" do
        expect(User.new(username: 'albert')).to have(0).error_on(:username)
      end
    end



    context 'when email is correct like: ' do 
      it "has minimum letters after dot(.) should save" do
        expect(User.new(email: 'sfd@sitelerwash.AZ')).to have(0).error_on(:email)
      end
      it "has a dot(.)com should save" do
        expect(User.new(email: 'sfd@sitelerwash.com')).to have(0).error_on(:email)
      end
      it "has maximum letters after dot(.) should save" do
        expect(User.new(email: 'sfd@sitelerwash.info')).to have(0).error_on(:email)
      end
    end



    context 'when password is correct like: ' do 
      it "password has mininum length (6) then validation passes" do
        expect(User.new(password: 'steven')).to have(0).error_on(:password)
      end
      it "password has maximum length (128) then validation passes" do
        expect(User.new(password: 'delarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosa')).to have(0).error_on(:password)
      end
    end
  end
end


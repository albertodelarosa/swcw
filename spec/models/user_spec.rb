require 'rails_helper'

RSpec.describe User do
  context 'unhappy' do ####################################################################

    context 'when username is somehow incorrect like: ' do
      attribute = "username"
      it{ should_not_save(User.new(),attribute, 0) }
      it{ should_not_save(User.new(attribute.to_sym => 'steve'),attribute, 0) }
    end

    context 'when email is somehow incorrect like: ' do
      attribute = "email"
      it{ should_not_save(User.new(),attribute, 2) }
      it{ should_not_save(User.new(attribute.to_sym => 'sfd'), attribute) }
      it{ should_not_save(User.new(attribute.to_sym => 'sfd.com'), attribute) }
      it{ should_not_save(User.new(attribute.to_sym => 'sfd@sitelerwash'), attribute) }
      it{ should_not_save(User.new(attribute.to_sym => 'sfd@sitelerwash.i'), attribute) }
      it{ should_not_save(User.new(attribute.to_sym => 'sfd@sitelerwash.infos'), attribute) }
      it{ should_not_save(User.new(attribute.to_sym => 'sfd@sitelerwash.in3s'), attribute) }
      it{ should_not_save(User.new(attribute.to_sym => 'sfd@sitelerwash.%ins'), attribute) }
      it{ should_not_save(User.new(attribute.to_sym => 'sfd@sitelerwash.inso^'), attribute) }
    end

    context 'when password is not correct like: ' do
      attribute = "password"
      it{ should_not_save(User.new(), attribute) }
      it{ should_not_save(User.new(attribute.to_sym => 'passw'), attribute)}
    end

    def should_not_save(my_user,attribute, equals=1)
      expect(my_user.valid?).to be_falsey
      expect(my_user.errors[attribute.to_sym].size).to eq(equals)
    end
  end


  context 'happy' do ####################################################################

    context 'when username is correct like: ' do
      attribute = "username"
      it{ should_save(User.new(attribute.to_sym => 'albert'), attribute) }
    end

    context 'when email is correct like: ' do
      attribute = "email"
      it{ should_save(User.new(attribute.to_sym => 'sfd@sitelerwash.AZ'), attribute) }
      it{ should_save(User.new(attribute.to_sym => 'sfd@sitelerwash.com'), attribute) }
      it{ should_save(User.new(attribute.to_sym => 'sfd@sitelerwash.info'), attribute) }
    end

    context 'when password is correct like: ' do
      attribute = "password"
      it{ should_save(User.new(attribute.to_sym => 'steven'), attribute) }
      it{ should_save(User.new(attribute.to_sym => 'delarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosadelarosa'), attribute) }
    end

    def should_save(my_user,attribute, equals=0)
      expect(my_user.valid?).to be_falsey
      expect(my_user.errors[attribute.to_sym].size).to eq(equals)
    end
  end

end


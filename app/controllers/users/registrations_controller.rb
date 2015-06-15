class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    @user = User.new(params_new_user)
    if @user.save!
      set_flash_message :notice, :signed_up
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_sign_in_path_for(@user)
    else
      render root_path()
    end
  end

  def edit
    user_signed_in?
    add_breadcrumb 'Edit User', 'Edit User'
    super
  end

  def update
    # required for settings form to submit when password is left blank
    # params[:user].delete("password")
    # params[:user].delete("password_confirmation")
    # params[:user].delete("current_password")

    # TODO if passwords present then need to authenticate the user with current password and need to update with new one

    if @user.update_attributes(params_update_user)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end




  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def params_update_user
      params.required(:user).permit(:username, :email, :current_password, :password, :password_confirmation, :remember_me,
                                    home_contact_info_attributes: [         :mobile, :phone1,       :phone2, :fax, :id ],
                                    work_contact_info_attributes: [ :email, :mobile, :phone1, :ext, :phone2, :fax, :id ],
                                    home_address_attributes:      [ :street1, :apt_no,    :street2, :city, :state, :zip, :id ],
                                    work_address_attributes:      [ :street1, :suite_no,  :street2, :city, :state, :zip, :id ]
                                   )
    end

    def params_new_user
      params.required(:user).permit(:username, :email, :password, :password_confirmation, :remember_me)
    end
end


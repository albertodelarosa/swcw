class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @role = Role.find_by_name(params[:role].humanize.titleize) if params[:role].present?
    super
  end

  def update
    # required for settings form to submit when password is left blank
    params[:user].delete("password")
    params[:user].delete("password_confirmation")
    params[:user].delete("current_password")

    # TODO if passwords present then need to authenticate the user with current password and need to update with new one

    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

end
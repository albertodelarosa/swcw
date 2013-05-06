class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def edit
    add_breadcrumb 'Hotel Manager', '<a href="/hotelmanager/">Hotel Manager</a>'
    add_breadcrumb 'Hotel Manager', 'Hotels'
    add_breadcrumb 'Edit User', 'Edit User'
    super
  end

  def update
    # required for settings form to submit when password is left blank
    params[:user].delete("password")
    params[:user].delete("password_confirmation")
    params[:user].delete("current_password")

    # TODO if passwords present then need to authenticate the user with current password and need to update with new one

    @user = User.find(current_user.id)
    company = Company.find(params[:company_id])
    @user.companies << company
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

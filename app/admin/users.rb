ActiveAdmin.register User do
  
  sidebar :sites, :only => :show do
    render :partial => "shared/admin/sidebar_sites", :locals => {:sites => User.find(params[:id]).sites }
  end

  sidebar :companies, :only => :show do
    render :partial => "shared/admin/sidebar_companies", :locals => {:companies => User.find(params[:id]).companies }
  end

  sidebar :vehicles, :only => :show do 
    render :partial => "shared/admin/sidebar_vehicles", :locals => {:vehicles => User.find(params[:id]).vehicles }
  end

  form do |f|
    f.inputs "Edit User" do
      f.input :email
      f.input :username
      f.input :salutation
      f.input :first_name
      f.input :last_name
      f.input :suffix
      #f.input :home_address
      #f.input :
      #f.input :
      #f.input :
      #f.input :published_at, :label => "Publish Post At"
    end
    #f.inputs "Content" do
      #f.input :body
    #end
    f.actions
  end


#:, :, :, :password_confirmation, :remember_me, 
                  #:, :, :, :,
                  #:home_address_attributes, :, :home_contact_info_attributes, :home_contact_info, 
                  #:work_address_attributes, :work_address, :work_contact_info_attributes, :work_contact_info, 
                  #:companies_attributes, :vehicles_attributes






  #encrypted_password, 
  #reset_password_token, 
  #reset_password_sent_at(1i), 
  #reset_password_sent_at(2i), 
  #reset_password_sent_at(3i), 
  #reset_password_sent_at(4i), 
  #reset_password_sent_at(5i), 
  #remember_created_at(1i), 
  #remember_created_at(2i), 
  #remember_created_at(3i), 
  #remember_created_at(4i), 
  #remember_created_at(5i), 
  #current_sign_in_at(1i), 
  #current_sign_in_at(2i), 
  #current_sign_in_at(3i), 
  #current_sign_in_at(4i), 
  #current_sign_in_at(5i), 
  #last_sign_in_at(1i), 
  #last_sign_in_at(2i), 
  #last_sign_in_at(3i), 
  #last_sign_in_at(4i), 
  #last_sign_in_at(5i), 
  #current_sign_in_ip, 
  #last_sign_in_ip
end

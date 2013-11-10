ActiveAdmin.register Company do
  
  sidebar :sites, :only => :show do
    render :partial => "shared/admin/sidebar_sites", :locals => {:sites => Company.find(params[:id]).sites }
  end

  sidebar :users, :only => :show do 
    render :partial => "shared/admin/sidebar_users", :locals => {:users => Company.find(params[:id]).clients }
  end

  show do |company|
    attributes_table do
      row :id
      row :company_id
      row :name
      row :description
      row :corporate_email_domain
      row :siteler_dollars_percentage
      row :remove_cc_info
      row :user_reg_allowed
      row :paypal_allowed
      row :coupons_allowd
      row :google_checkout_allowed
      #if company.sites.length <= 0
        #row :site do
          #"There is no company associated with this Site yet."
        #end
      #elsif company.sites.length == 1
        #row :site do 
          #company.sites[0]
        #end
      #elsif company.sites.length > 1
        #company.sites.each_index do |i|
            #row "site #{i+1}" do
              #company.sites[i]
            #end
        #end
      #end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
 end

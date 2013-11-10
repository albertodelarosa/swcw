ActiveAdmin.register Site do
  
  sidebar :companies, :only => :show do
    render :partial => "shared/admin/sidebar_companies", :locals => {:companies => Site.find(params[:id]).companies }
  end

  sidebar :vehicles, :only => :show do 
    render :partial => "shared/admin/sidebar_vehicles", :locals => {:vehicles => Site.find(params[:id]).vehicles }
  end

  sidebar :users, :only => :show do 
    render :partial => "shared/admin/sidebar_users", :locals => {:users => Site.find(params[:id]).clients }
  end

end

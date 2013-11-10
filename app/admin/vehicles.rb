ActiveAdmin.register Vehicle do
  
  sidebar :owners, :only => :show do 
    render :partial => "shared/admin/sidebar_users", :locals => {:users => Vehicle.find(params[:id]).owners }
  end

  sidebar :sites, :only => :show do
    render :partial => "shared/admin/sidebar_sites", :locals => {:sites => Vehicle.find(params[:id]).sites }
  end

  sidebar :companies, :only => :show do
    render :partial => "shared/admin/sidebar_companies", :locals => {:companies => Vehicle.find(params[:id]).companies }
  end

end

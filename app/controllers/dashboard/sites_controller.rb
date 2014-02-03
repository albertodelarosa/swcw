class Dashboard::SitesController < Dashboard::DashboardsController
  before_filter { add_breadcrumb "sites", dashboard_sites_path, "glyphicon-tower" }

  # GET /customers/sites
  # GET /customers/sites.json
  def index
    add_breadcrumb "all", nil, "glyphicon-list"

    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # GET /customers/sites/1
  # GET /customers/sites/1.json
  def show
    add_breadcrumb "all", nil, "glyphicon-screenshot"

    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /customers/sites/new
  # GET /customers/sites/new.json
  def new
    add_breadcrumb "add", nil, "glyphicon-plus-sign"

    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /customers/sites/1/edit
  def edit
    add_breadcrumb "edit", nil, "glyphicon-edit"

    @sites = current_user.sites
    @site = Site.find(params[:id])
  end

  # POST /customers/sites
  # POST /customers/sites.json
  def create
    @site = Site.find(params[:site][:id])

    respond_to do |format|
      if @site.save
        current_user.sites << @site
        format.html { redirect_to root_path, notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/sites/1
  # PUT /customers/sites/1.json
  def update
    #@old_site = Site.find(params[:id])
    site = Site.find(params[:site][:id])
    if current_user.sites.include?(site)
      @site = current_user.sites.delete(site)
    else
      @site = site
    end

    respond_to do |format|
      #if current_user.sites.delete(@old_site)
      if current_user.sites << @site
        format.html { redirect_to root_path, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors.errors, status: :unprocessable_entity }
        #format.json { render json: @old_site.errors.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/sites/1
  # DELETE /customers/sites/1.json
  def destroy
    @site = Site.find(params[:id])
    #@site.destroy #only admin can destroy a site

    respond_to do |format|
      if current_user.sites.delete(@site)
        format.html { redirect_to root_path }
        format.json { head :no_content }
      end
    end
  end
end

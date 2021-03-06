class Dashboard::SitesController < Dashboard::DashboardsController
  before_filter { add_breadcrumb "sites", dashboard_sites_path, "glyphicon-tower" }

  # GET /customers/sites
  # GET /customers/sites.json
  def index
    add_breadcrumb "all", nil, "glyphicon-list"

    @sites =  current_user.account.sites || []

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # GET /customers/sites/1
  # GET /customers/sites/1.json
  def show
    add_breadcrumb "all", nil, "glyphicon-screenshot"

    @site = Site.find(id_from_params)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /customers/sites/new
  # GET /customers/sites/new.json
  def new
    add_breadcrumb "add", nil, "glyphicon-plus-sign"

    if current_user.account.companies.empty?
      respond_to do |format|
        format.html { redirect_to new_dashboard_company_url, status: 302, notice: 'You need to pick a company first.' }
      end
    else
      @companies_sites = current_user.account.companies.zip( current_user.account.sites )
      @current_company = @companies_sites.last.first
      @current_company_sites = @current_company.sites

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: [ @companies_sites, @current_company, @current_company_sites ] }
      end
    end
  end

  # GET /customers/sites/1/edit
  def edit
    add_breadcrumb "edit", nil, "glyphicon-edit"

    @sites = current_user.account.sites
    @site = Site.find(id_from_params)
  end

  # POST /customers/sites
  # POST /customers/sites.json
  def create
    respond_to do |format|
      if @site = Site.find(entity_id_from_params(:site))
        current_user.account.sites << @site
        format.html { redirect_to root_path, notice: "The site #{@site.name} @ #{@site.companies.last.name} was successfully added." }
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
    @site = Site.find(id_from_params)

    respond_to do |format|
        current_user.account.sites.delete(@site)
        current_user.account.sites << @site
      if current_user.account.sites.exists? @site
        format.html { redirect_to root_path, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/sites/1
  # DELETE /customers/sites/1.json
  def destroy
    @site = Site.find(id_from_params)

    respond_to do |format|
      if current_user.account.sites.delete(@site)
        format.html { redirect_to root_path }
        format.json { head :no_content }
      end
    end
  end

end

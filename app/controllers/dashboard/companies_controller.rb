class Dashboard::CompaniesController < Dashboard::DashboardsController
  before_filter { add_breadcrumb "companies", dashboard_companies_path, "glyphicon-briefcase" }

  # GET /dashboard/companies
  # GET /dashboard/companies.json
  def index
    add_breadcrumb "all", nil, "glyphicon-list"

    @companies = current_user.companies || []

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /dashboard/companies/1
  # GET /dashboard/companies/1.json
  def show
    add_breadcrumb "all", nil, "glyphicon-screenshot"

    @company = Company.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /dashboard/companies/new
  # GET /dashboard/companies/new.json
  def new
    add_breadcrumb "add", nil, "glyphicon-plus-sign"

    @companies = current_user.companies || []
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /dashboard/companies/1/edit
  def edit
    add_breadcrumb "edit", nil, "glyphicon-edit"

    @company = Company.find(params[:id])
  end

  # POST /dashboard/companies
  # POST /dashboard/companies.json
  def create
    @company = Company.find(params[:company][:id])

    respond_to do |format|
      @company.clients << current_user
      format.html { redirect_to root_path, notice: 'Company was successfully created.' }
      format.json
    end
  end

  # PUT /dashboard/companies/1
  # PUT /dashboard/companies/1.json
  def update
      @company = Company.find(params[:id])

      respond_to do |format|
        if @company.clients.exists? current_user
          @company.clients.delete(current_user)
          @company.clients << current_user

          format.html { redirect_to root_path, notice: 'Company was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "new", notice: 'Company was successfully updated.' }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /dashboard/companies/1
  # DELETE /dashboard/companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.clients.delete(current_user)
    #current_user.companies.delete(@company)
    #@company.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end

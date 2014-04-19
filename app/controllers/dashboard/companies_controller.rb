class Dashboard::CompaniesController < Dashboard::DashboardsController
  before_filter { add_breadcrumb "companies", dashboard_companies_path, "glyphicon-briefcase" }

  # GET /dashboard/companies
  # GET /dashboard/companies.json
  def index
    add_breadcrumb "all", nil, "glyphicon-list"

    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /dashboard/companies/1
  # GET /dashboard/companies/1.json
  def show
    add_breadcrumb "all", nil, "glyphicon-screenshot"

    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /dashboard/companies/new
  # GET /dashboard/companies/new.json
  def new
    add_breadcrumb "add", nil, "glyphicon-plus-sign"

    @companies = Company.all
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
      current_user.companies << @company
      format.html { redirect_to root_path, notice: 'Company was successfully created.' }
      format.json

      #if @company.save
        #format.html { redirect_to root_path, notice: 'Company was successfully created.' }
        #format.json { render json: @company, status: :created, location: @company }
      #else
        #format.html { render action: "new" }
        #format.json { render json: @company.errors, status: :unprocessable_entity }
      #end

    end
  end

  # PUT /dashboard/companies/1
  # PUT /dashboard/companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Company was successfully updated.' }
      format.json { head :no_content }

      #if @company.update_attributes(params[:company])
        #format.html { redirect_to root_path, notice: 'Company was successfully updated.' }
        #format.json { head :no_content }
      #else
        #format.html { render action: "edit" }
        #format.json { render json: @company.errors, status: :unprocessable_entity }
      #end

    end
  end

  # DELETE /dashboard/companies/1
  # DELETE /dashboard/companies/1.json
  def destroy
    @company = Company.find(params[:id])
    current_user.companies.delete(@company)
    #@company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
end

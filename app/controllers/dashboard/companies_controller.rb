class Dashboard::CompaniesController < Dashboard::DashboardsController
  before_filter { add_breadcrumb "companies", dashboard_companies_path, "glyphicon-briefcase" }

  # GET /dashboard/companies
  # GET /dashboard/companies.json
  def index
    add_breadcrumb "all", nil, "glyphicon-list"

    @companies = current_user.account.companies || []

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /dashboard/companies/1
  # GET /dashboard/companies/1.json
  def show
    add_breadcrumb "all", nil, "glyphicon-screenshot"

    @company = Company.find(id_from_params)

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

    if current_user.account.companies.empty?
      @company = @companies.first
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @companies }
      end
    else
      @company = current_user.account.companies.last
      respond_to do |format|
        format.html { redirect_to edit_dashboard_company_path(@company), notice: 'Please update your company listing' }
        format.json { render json: current_user.accounts.companies.last }
      end
    end
  end

  # GET /dashboard/companies/1/edit
  def edit
    add_breadcrumb "edit", nil, "glyphicon-edit"

    @company = Company.find(id_from_params)
  end

  # POST /dashboard/companies
  # POST /dashboard/companies.json
  def create
    if @company = Company.find(entity_id_from_params(:company))
      respond_to do |format|
        current_user.account.companies << @company
        format.html { redirect_to root_path, notice: 'Company was successfully created.' }
        format.json
      end
    end
  end

  # PUT /dashboard/companies/1
  # PUT /dashboard/companies/1.json
  def update
      @company = Company.find(id_from_params)

      respond_to do |format|
        if @company.accounts.exists? current_user.account.id
          @company.accounts.delete(current_user.account)
          @company.accounts << current_user.account

          format.html { redirect_to root_path, notice: 'Company was successfully updated.' }
          format.json { head :no_content }
        else
          @company.accounts << current_user.account
          format.html { redirect_to root_path, notice: 'Company was successfully updated.' }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /dashboard/companies/1
  # DELETE /dashboard/companies/1.json
  def destroy
    @company = Company.find(id_from_params)
    @company.accounts.delete(current_user.account)
    #current_user.companies.delete(@company)
    #@company.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

end

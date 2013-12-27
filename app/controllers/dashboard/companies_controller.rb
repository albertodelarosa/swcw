class Dashboard::CompaniesController < Dashboard::DashboardsController
  # GET /dashboard/companies
  # GET /dashboard/companies.json
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /dashboard/companies/1
  # GET /dashboard/companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /dashboard/companies/new
  # GET /dashboard/companies/new.json
  def new
    @companies = Company.all
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /dashboard/companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /dashboard/companies
  # POST /dashboard/companies.json
  def create
    #@company = Company.new(params[:company])
    @company = Company.find(params[:company][:id])
    current_user.companies << @company

    respond_to do |format|
      if @company.save
        format.html { redirect_to root_path, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dashboard/companies/1
  # PUT /dashboard/companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/companies/1
  # DELETE /dashboard/companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_companies_url }
      format.json { head :no_content }
    end
  end
end

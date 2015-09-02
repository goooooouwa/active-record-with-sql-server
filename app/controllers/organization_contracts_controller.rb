class OrganizationContractsController < ApplicationController
  before_action :set_organization_contract, only: [:show, :edit, :update, :destroy]

  # GET /organization_contracts
  # GET /organization_contracts.json
  def index
    @organization_contracts = OrganizationContract.all
  end

  # GET /organization_contracts/1
  # GET /organization_contracts/1.json
  def show
  end

  # GET /organization_contracts/new
  def new
    @organization_contract = OrganizationContract.new
  end

  # GET /organization_contracts/1/edit
  def edit
  end

  # POST /organization_contracts
  # POST /organization_contracts.json
  def create
    @organization_contract = OrganizationContract.new(organization_contract_params)

    respond_to do |format|
      if @organization_contract.save
        format.html { redirect_to @organization_contract, notice: 'Organization contract was successfully created.' }
        format.json { render :show, status: :created, location: @organization_contract }
      else
        format.html { render :new }
        format.json { render json: @organization_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_contracts/1
  # PATCH/PUT /organization_contracts/1.json
  def update
    respond_to do |format|
      if @organization_contract.update(organization_contract_params)
        format.html { redirect_to @organization_contract, notice: 'Organization contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization_contract }
      else
        format.html { render :edit }
        format.json { render json: @organization_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_contracts/1
  # DELETE /organization_contracts/1.json
  def destroy
    @organization_contract.destroy
    respond_to do |format|
      format.html { redirect_to organization_contracts_url, notice: 'Organization contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_contract
      @organization_contract = OrganizationContract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_contract_params
      params.require(:organization_contract).permit(:organization_id, :contract_id, :signed_by_user_id, :signed_dt, :created_dt, :modified_dt)
    end
end

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:time_created, :time_modified, :edit_sequence, :name, :full_name, :is_active, :parent_id, :sublevel, :company_name, :salutation, :first_name, :middle_name, :last_name, :job_title, :bill_address_addr1, :bill_address_addr2, :bill_address_addr3, :bill_address_addr4, :bill_address_addr5, :bill_address_city, :bill_address_state, :bill_address_postal_code, :bill_address_country, :bill_address_note, :bill_address_block_addr1, :bill_address_block_addr2, :bill_address_block_addr3, :bill_address_block_addr4, :bill_address_block_addr5, :ship_address_addr1, :ship_address_addr2, :ship_address_addr3, :ship_address_addr4, :ship_address_addr5, :ship_address_city, :ship_address_state, :ship_address_postal_code, :ship_address_country, :ship_address_note, :ship_address_block_addr1, :ship_address_block_addr2, :ship_address_block_addr3, :ship_address_block_addr4, :ship_address_block_addr5, :phone, :alt_phone, :fax, :email, :cc, :contact, :alt_contact, :customer_type_id, :customer_type_full_name, :terms_id, :terms_full_name, :sales_rep_id, :sales_rep_full_name, :balance, :total_balance, :sales_tax_code_id, :sales_tax_code_full_name, :item_sales_tax_id, :item_sales_tax_full_name, :resale_number, :account_number, :preferred_payment_method_id, :preferred_payment_method_full_name, :job_status, :job_start_date, :job_projected_end_date, :job_end_date, :job_desc, :job_type_id, :job_type_full_name, :preferred_delivery_method, :price_level_id, :price_level_full_name, :primary_contact, :primary_email, :primary_phone, :Project_PKEY, :CreationTimeStamp, :CreationUser, :LastModificationTimeStamp, :LastModificationUser, :FK_Customers_PKEY, :FK_Jobs_PKEY, :FK_ProgMan_Employees_PKEY, :FK_ProjMan_Employees_PKEY, :FK_TechLead_Employees_PKEY, :FK_Foreman_Employees_PKEY, :FK_TechForeman_Employees_PKEY, :Project_Name, :Project_Type, :Project_DateStartEstimated, :Project_DateEndEstimated, :Project_RoughInStart, :Project_RoughInEnd, :Project_DeviceInstallStart, :Project_DeviceInstallEnd, :Project_CommissioningStart, :Project_CommissioningEnd, :Project_ScopeText, :Project_NameSalutation, :Project_NameFirst, :Project_NameMiddle, :Project_NameLast, :Project_PhoneMain, :Project_EmailMain, :Project_PhoneAlternate, :Project_EmailCC, :Project_PhoneCell, :Project_PhoneFax, :Project_Address1, :Project_Address2, :Project_Address_Parking1, :Project_Address_Parking2, :Project_City, :Project_State, :Project_Zip, :Project_Park_1_Address, :Project_Park_1_Address_City, :Project_Park_1_Address_State, :Project_Park_1_Address_Zip, :Project_Park_2_Address, :Project_Park_2_Address_City, :Project_Park_2_Address_State, :Project_Park_2_Address_Zip, :Project_PercentComplete, :Project_IsClosed, :Project_Status, :Project_QuotedTechLabor, :Project_QuotedRILabor, :Project_QuotedDILabor, :Project_QuotedCOLabor, :Project_QuotedEngLabor, :Project_QuotedPMLabor, :Project_UseCase, :Project_QuotedLgstLabor)
    end
end

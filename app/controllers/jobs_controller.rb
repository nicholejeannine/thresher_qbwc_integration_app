class JobsController < ApplicationController
  before_action :set_job, only: [:show]

  # GET /jobs
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:time_created, :time_modified, :edit_sequence, :name, :full_name, :is_active, :parent_id, :sublevel, :company_name, :salutation, :first_name, :middle_name, :last_name, :job_title, :bill_address_addr1, :bill_address_addr2, :bill_address_addr3, :bill_address_addr4, :bill_address_addr5, :bill_address_city, :bill_address_state, :bill_address_postal_code, :bill_address_country, :bill_address_note, :bill_address_block_addr1, :bill_address_block_addr2, :bill_address_block_addr3, :bill_address_block_addr4, :bill_address_block_addr5, :ship_address_addr1, :ship_address_addr2, :ship_address_addr3, :ship_address_addr4, :ship_address_addr5, :ship_address_city, :ship_address_state, :ship_address_postal_code, :ship_address_country, :ship_address_note, :ship_address_block_addr1, :ship_address_block_addr2, :ship_address_block_addr3, :ship_address_block_addr4, :ship_address_block_addr5, :phone, :alt_phone, :fax, :email, :cc, :contact, :alt_contact, :customer_type_id, :customer_type_full_name, :terms_id, :terms_full_name, :sales_rep_id, :sales_rep_full_name, :balance, :total_balance, :sales_tax_code_id, :sales_tax_code_full_name, :item_sales_tax_id, :item_sales_tax_full_name, :resale_number, :account_number, :preferred_payment_method_id, :preferred_payment_method_full_name, :job_status, :job_start_date, :job_projected_end_date, :job_end_date, :job_desc, :job_type_id, :job_type_full_name, :preferred_delivery_method, :price_level_id, :price_level_full_name, :primary_contact, :primary_email, :primary_phone, :Jobs_PKEY, :CreationTimeStamp, :CreationUser, :LastModificationTimeStamp, :LastModificationUser, :FK_Customers_PKEY, :FK_JobID_Parent, :Job_CustCLNo, :Job_CustPONo, :Job_DateEndActual, :Job_DateEndProjected, :Job_DateStartActual, :Job_DateStartProjected, :Job_Description_Long, :Job_Description_Short, :Job_HourType)
    end
end

class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:customer).permit(:time_created, :time_modified, :edit_sequence, :name, :full_name, :is_active, :class_id, :parent_id, :sublevel, :company_name, :salutation, :first_name, :middle_name, :last_name, :suffix, :job_title, :bill_address_addr1, :bill_address_addr2, :bill_address_addr3, :bill_address_addr4, :bill_address_addr5, :bill_address_city, :bill_address_state, :bill_address_postal_code, :bill_address_country, :bill_address_note, :ship_address_addr1, :ship_address_addr2, :ship_address_addr3, :ship_address_addr4, :ship_address_addr5, :ship_address_city, :ship_address_state, :ship_address_postal_code, :ship_address_country, :ship_address_note, :print_as, :phone, :mobile, :pager, :alt_phone, :fax, :email, :cc, :contact, :alt_contact, :additional_contact_id, :contacts_id, :customer_type_id, :terms_id, :sales_rep_id, :balance, :total_balance, :sales_tax_code_id, :item_sales_tax_id, :sales_tax_country, :resale_number, :account_number, :credit_limit, :preferred_payment_method_id, :credit_card_info, :job_status, :job_start_date, :job_projected_end_date, :job_end_date, :job_desc, :job_type_id, :notes, :additional_notes_id, :is_statement_with_parent, :delivery_method, :preferred_delivery_method, :price_level_id, :external_guid, :tax_registration_number, :currency_id, :data_ext_id)
    end
end

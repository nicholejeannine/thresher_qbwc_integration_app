class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:id, :time_created, :time_modified, :edit_sequence, :name, :full_name, :is_active, :class_id, :parent_id, :sublevel, :company_name, :salutation, :first_name, :middle_name, :last_name, :job_title, :bill_address_addr1, :bill_address_addr2, :bill_address_addr3, :bill_address_addr4, :bill_address_addr5, :bill_address_city, :bill_address_state, :bill_address_postal_code, :bill_address_country, :bill_address_note, :ship_address_addr1, :ship_address_addr2, :ship_address_addr3, :ship_address_addr4, :ship_address_addr5, :ship_address_city, :ship_address_state, :ship_address_postal_code, :ship_address_country, :ship_address_note, :phone, :alt_phone, :fax, :email, :cc, :contact, :alt_contact, :additional_contact_ref_contact_name, :additional_contact_ref_contact_value, :contacts_id, :customer_type_id, :terms_id, :sales_rep_id, :balance, :total_balance, :sales_tax_code_id, :item_sales_tax_id, :resale_number, :account_number, :credit_limit, :preferred_payment_method_id, :credit_card_info_credit_card_number, :credit_card_info_expiration_month, :credit_card_info_expiration_year, :credit_card_info_name_on_card, :credit_card_info_credit_card_address, :credit_card_info_credit_card_postal_code, :job_status, :job_start_date, :job_projected_end_date, :job_end_date, :job_desc, :job_type_id, :notes, :additional_notes_ret_note_id, :preferred_delivery_method, :price_level_id, :external_guid, :currency_id, :data_ext_ret_owner_id)
    end

end

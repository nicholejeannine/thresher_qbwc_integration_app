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

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
        format.xml { redirect_to @customer, notice: 'Customer was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
        format.xml { render :new }

      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
        format.xml { redirect_to @customer, notice: 'Customer was successfully updated.' }

      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
        format.xml { render :edit }

      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
      format.xml { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:list_id, :time_created, :time_modified, :edit_sequence, :name, :full_name, :is_active, :class_ref_list_id, :parent_ref_list_id, :sublevel, :company_name, :salutation, :first_name, :middle_name, :last_name, :job_title, :bill_address_addr1, :bill_address_addr2, :bill_address_addr3, :bill_address_addr4, :bill_address_addr5, :bill_address_city, :bill_address_state, :bill_address_postal_code, :bill_address_country, :bill_address_note, :bill_address_block_addr1, :bill_address_block_addr2, :bill_address_block_addr3, :bill_address_block_addr4, :bill_address_block_addr5, :ship_address_addr1, :ship_address_addr2, :ship_address_addr3, :ship_address_addr4, :ship_address_addr5, :ship_address_block_addr1, :ship_address_block_addr2, :ship_address_block_addr3, :ship_address_block_addr4, :ship_address_block_addr5, :ship_address_city, :ship_address_state, :ship_address_postal_code, :ship_address_country, :ship_address_note, :ship_to_address_name, :ship_to_address_addr1, :ship_to_address_addr2, :ship_to_address_addr3, :ship_to_address_addr4, :ship_to_address_addr5, :ship_to_address_city, :ship_to_address_state, :ship_to_address_postal_code, :ship_to_address_country, :ship_to_address_note, :ship_to_address_default_ship_to, :phone, :alt_phone, :fax, :email, :cc, :contact, :alt_contact, :additional_contact_ref_contact_name, :additional_contact_ref_contact_value, :contacts_ret_list_id, :customer_type_ref_list_id, :terms_ref_list_id, :sales_rep_ref_list_id, :balance, :total_balance, :sales_tax_code_ref_list_id, :item_sales_tax_ref_list_id, :resale_number, :account_number, :credit_limit, :preferred_payment_method_ref_list_id, :credit_card_info_credit_card_number, :credit_card_info_expiration_month, :credit_card_info_expiration_year, :credit_card_info_name_on_card, :credit_card_info_credit_card_address, :credit_card_info_credit_card_postal_code, :job_status, :job_start_date, :job_projected_end_date, :job_end_date, :job_desc, :job_type_ref_list_id, :notes, :additional_notes_ret_note_id, :preferred_delivery_method, :price_level_ref_list_id, :external_guid, :currency_ref_list_id, :data_ext_ret_owner_id)
    end
end

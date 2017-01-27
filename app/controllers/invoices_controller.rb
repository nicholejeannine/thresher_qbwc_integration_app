class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to @invoice, notice: 'Invoice was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /invoices/1
  def update
    if @invoice.update(invoice_params)
      redirect_to @invoice, notice: 'Invoice was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
    redirect_to invoices_url, notice: 'Invoice was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invoice_params
      params.require(:invoice).permit(:id, :time_created, :time_modified, :edit_sequence, :txn_number, :customer_id, :customer_full_name, :ar_account_id, :ar_account_full_name, :template_id, :template_full_name, :txn_date, :ref_number, :bill_address_addr1, :bill_address_addr2, :bill_address_addr3, :bill_address_addr4, :bill_address_addr5, :bill_address_city, :bill_address_state, :bill_address_postal_code, :bill_address_country, :bill_address_note, :bill_address_block_addr1, :bill_address_block_addr2, :bill_address_block_addr3, :bill_address_block_addr4, :bill_address_block_addr5, :ship_address_addr1, :ship_address_addr2, :ship_address_addr3, :ship_address_addr4, :ship_address_addr5, :ship_address_city, :ship_address_state, :ship_address_postal_code, :ship_address_country, :ship_address_note, :ship_address_block_addr1, :ship_address_block_addr2, :ship_address_block_addr3, :ship_address_block_addr4, :ship_address_block_addr5, :is_pending, :is_finance_charge, :po_number, :terms_id, :terms_full_name, :due_date, :sales_rep_id, :sales_rep_full_name, :fob, :ship_date, :ship_method_id, :ship_method_full_name, :subtotal, :item_sales_tax_id, :item_sales_tax_full_name, :sales_tax_percentage, :sales_tax_total, :applied_amount, :balance_remaining, :memo, :is_paid, :customer_msg_id, :customer_msg_full_name, :is_to_be_printed, :is_to_be_emailed, :customer_sales_tax_code_id, :customer_sales_tax_code_full_name, :suggested_discount_amount, :suggested_discount_date, :linked_txn_id, :linked_txn_type, :linked_txn_date, :linked_txn_ref_number, :linked_txn_link_type, :linked_txn_amount)
    end
end

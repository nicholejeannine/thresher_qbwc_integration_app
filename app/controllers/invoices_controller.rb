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
      params.require(:invoice).permit(:txn_id, :time_created, :time_modified, :edit_sequence, :txn_number, :customer_ref, :class_ref, :ar_account_ref, :template_ref, :txn_date, :ref_number, :bill_address, :bill_address_block, :ship_address, :ship_address_block, :is_pending, :is_finance_charge, :po_number, :terms_ref, :due_date, :sales_rep_ref, :fob, :ship_date, :ship_method_ref, :subtotal, :item_sales_tax_ref, :sales_tax_percentage, :sales_tax_total, :applied_amount, :balance_remaining, :currency_ref, :exchange_rate, :balance_remaining_in_home_currency, :memo, :is_paid, :customer_msg_ref, :is_to_be_printed, :is_to_be_emailed, :is_tax_included, :customer_sales_tax_code_ref, :suggested_discount_amount, :suggested_discount_date, :other, :external_guid, :linked_txn, :invoice_line_ret, :invoice_line_group_ret, :discount_line_ret, :sales_tax_line_ret, :shipping_line_ret, :data_ext_ret)
    end
end

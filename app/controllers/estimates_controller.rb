class EstimatesController < ApplicationController
  before_action :set_estimate, only: [:show, :edit, :update, :destroy]

  # GET /estimates
  def index
    @estimates = Estimate.all
  end

  # GET /estimates/1
  def show
  end

  # GET /estimates/new
  def new
    @estimate = Estimate.new
  end

  # GET /estimates/1/edit
  def edit
  end

  # POST /estimates
  def create
    @estimate = Estimate.new(estimate_params)

    if @estimate.save
      redirect_to @estimate, notice: 'Estimate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /estimates/1
  def update
    if @estimate.update(estimate_params)
      redirect_to @estimate, notice: 'Estimate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /estimates/1
  def destroy
    @estimate.destroy
    redirect_to estimates_url, notice: 'Estimate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate
      @estimate = Estimate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estimate_params
      params.require(:estimate).permit(:time_created, :time_modified, :edit_sequence, :txn_number, :customer_id, :class_id, :template_id, :txn_date, :ref_number, :bill_address_addr1, :bill_address_addr2, :bill_address_addr3, :bill_address_addr4, :bill_address_addr5, :bill_address_city, :bill_address_state, :bill_address_postal_code, :bill_address_country, :bill_address_note, :ship_address_addr1, :ship_address_addr2, :ship_address_addr3, :ship_address_addr4, :ship_address_addr5, :ship_address_city, :ship_address_state, :ship_address_postal_code, :ship_address_country, :ship_address_note, :is_active, :po_number, :terms_id, :due_date, :sales_rep_id, :fob, :subtotal, :item_sales_tax_id, :sales_tax_percentage, :sales_tax_total, :total_amount, :currency_id, :exchange_rate, :total_amount_in_home_currency, :memo, :customer_msg_id, :is_to_be_emailed, :is_tax_included, :customer_sales_tax_code_id, :other, :external_guid, :linked_txn, :estimate_line_id, :estimate_line_group_id, :data_ext_id)
    end
end

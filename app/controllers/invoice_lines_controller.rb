class InvoiceLinesController < ApplicationController
  before_action :set_invoice_line, only: [:show, :edit, :update, :destroy]

  # GET /invoice_lines
  def index
    @invoice_lines = InvoiceLine.all
  end

  # GET /invoice_lines/1
  def show
  end

  # GET /invoice_lines/new
  def new
    @invoice_line = InvoiceLine.new
  end

  # GET /invoice_lines/1/edit
  def edit
  end

  # POST /invoice_lines
  def create
    @invoice_line = InvoiceLine.new(invoice_line_params)

    if @invoice_line.save
      redirect_to @invoice_line, notice: 'Invoice line was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /invoice_lines/1
  def update
    if @invoice_line.update(invoice_line_params)
      redirect_to @invoice_line, notice: 'Invoice line was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invoice_lines/1
  def destroy
    @invoice_line.destroy
    redirect_to invoice_lines_url, notice: 'Invoice line was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_line
      @invoice_line = InvoiceLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invoice_line_params
      params.require(:invoice_line).permit(:invoice_id, :item_id, :item_full_name, :desc, :quantity, :unit_of_measure, :override_uom_set_id, :override_uom_set_full_name, :rate, :rate_percent, :amount, :inventory_site_id, :inventory_site_full_name, :inventory_site_location_id, :inventory_site_location_full_name, :serial_number, :lot_number, :service_date, :sales_tax_code_id, :sales_tax_code_full_name)
    end
end

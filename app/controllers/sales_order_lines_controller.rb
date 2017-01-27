class SalesOrderLinesController < ApplicationController
  before_action :set_sales_order_line, only: [:show]

  # GET /sales_order_lines
  def index
    @sales_order_lines = SalesOrderLine.all
  end

  # GET /sales_order_lines/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_order_line
      @sales_order_line = SalesOrderLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sales_order_line_params
      params.require(:sales_order_line).permit(:sales_order_id, :item_id, :item_full_name, :desc, :quantity, :unit_of_measure, :override_uom_set_id, :override_uom_set_full_name, :rate, :rate_percent, :amount, :inventory_site_id, :inventory_site_full_name, :inventory_site_location_id, :inventory_site_location_full_name, :serial_number, :lot_number, :sales_tax_code_id, :sales_tax_code_full_name, :invoiced, :is_manually_closed)
    end
end

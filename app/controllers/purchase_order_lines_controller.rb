class PurchaseOrderLinesController < ApplicationController
  before_action :set_purchase_order_line, only: [:show]

  # GET /purchase_order_lines
  def index
    @purchase_order_lines = PurchaseOrderLine.all
  end

  # GET /purchase_order_lines/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order_line
      @purchase_order_line = PurchaseOrderLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_order_line_params
      params.require(:purchase_order_line).permit(:purchase_order_id, :item_id, :item_full_name, :manufacturer_part_number, :desc, :quantity, :unit_of_measure, :override_uom_set_id, :override_uom_set_full_name, :rate, :amount, :inventory_site_location_id, :inventory_site_location_full_name, :customer_id, :customer_full_name, :service_date, :received_quantity, :unbilled_quantity, :is_billed, :is_manually_closed)
    end
end

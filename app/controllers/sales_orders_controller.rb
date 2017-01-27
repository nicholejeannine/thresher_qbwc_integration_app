class SalesOrdersController < ApplicationController
  before_action :set_sales_order, only: [:show]

  # GET /sales_orders
  def index
    @sales_orders = SalesOrder.all
  end

  # GET /sales_orders/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_order
      @sales_order = SalesOrder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sales_order_params
      params.require(:sales_order).permit(:id, :time_created, :time_modified, :edit_sequence, :txn_number, :customer_id, :customer_full_name, :template_id, :template_full_name, :txn_date, :ref_number, :bill_address_addr1, :bill_address_addr2, :bill_address_addr3, :bill_address_addr4, :bill_address_addr5, :bill_address_city, :bill_address_state, :bill_address_postal_code, :bill_address_country, :bill_address_note, :bill_address_block_addr1, :bill_address_block_addr2, :bill_address_block_addr3, :bill_address_block_addr4, :bill_address_block_addr5, :ship_address_addr1, :ship_address_addr2, :ship_address_addr3, :ship_address_addr4, :ship_address_addr5, :ship_address_city, :ship_address_state, :ship_address_postal_code, :ship_address_country, :ship_address_note, :ship_address_block_addr1, :ship_address_block_addr2, :ship_address_block_addr3, :ship_address_block_addr4, :ship_address_block_addr5, :po_number, :terms_id, :terms_full_name, :due_date, :sales_rep_id, :sales_rep_full_name, :fob, :ship_date, :ship_method_id, :ship_method_full_name, :subtotal, :item_sales_tax_id, :item_sales_tax_full_name, :sales_tax_percentage, :sales_tax_total, :total_amount, :is_manually_closed, :is_fully_invoiced, :memo, :customer_msg_id, :customer_msg_full_name, :is_to_be_printed, :is_to_be_emailed, :customer_sales_tax_code_id, :customer_sales_tax_code_full_name, :linked_txn_id, :linked_txn_type, :linked_txn_date, :linked_txn_ref_number, :linked_txn_link_type, :linked_txn_amount)
    end
end

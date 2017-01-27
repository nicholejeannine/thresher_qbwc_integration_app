class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]

  # GET /purchase_orders
  def index
    @purchase_orders = PurchaseOrder.all
  end

  # GET /purchase_orders/1
  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)

    if @purchase_order.save
      redirect_to @purchase_order, notice: 'Purchase order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /purchase_orders/1
  def update
    if @purchase_order.update(purchase_order_params)
      redirect_to @purchase_order, notice: 'Purchase order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /purchase_orders/1
  def destroy
    @purchase_order.destroy
    redirect_to purchase_orders_url, notice: 'Purchase order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_order_params
      params.require(:purchase_order).permit(:id, :time_created, :time_modified, :edit_sequence, :txn_number, :vendor_id, :vendor_full_name, :inventory_site_id, :inventory_site_full_name, :ship_to_entity_id, :ship_to_entity_full_name, :template_id, :template_full_name, :txn_date, :ref_number, :vendor_address_addr1, :vendor_address_addr2, :vendor_address_addr3, :vendor_address_addr4, :vendor_address_addr5, :vendor_address_city, :vendor_address_state, :vendor_address_postal_code, :vendor_address_country, :vendor_address_note, :vendor_address_block_addr1, :vendor_address_block_addr2, :vendor_address_block_addr3, :vendor_address_block_addr4, :vendor_address_block_addr5, :ship_address_addr1, :ship_address_addr2, :ship_address_addr3, :ship_address_addr4, :ship_address_addr5, :ship_address_city, :ship_address_state, :ship_address_postal_code, :ship_address_country, :ship_address_note, :ship_address_block_addr1, :ship_address_block_addr2, :ship_address_block_addr3, :ship_address_block_addr4, :ship_address_block_addr5, :terms_id, :terms_full_name, :due_date, :expected_date, :ship_method_id, :ship_method_full_name, :fob, :total_amount, :is_manually_closed, :is_fully_received, :memo, :vendor_msg, :is_to_be_printed, :is_to_be_emailed, :linked_txn_id, :linked_txn_type, :linked_txn_date, :linked_txn_ref_number, :linked_txn_link_type, :linked_txn_amount)
    end
end

class ItemWorker < QBWC::Worker
  
  def requests(job, session, data)
    {:item_query_rq => {
        :xml_attributes => {:iterator  => "Start" },
        :max_returned => 100,
        :active_status => "All",
        # :include_ret_element => ['ListID', 'Name', 'FullName', 'BarCodeValue', 'IsActive'],
    }
    }
  end
  # Let's just handle inventory and non-inventory items, and inline it since this is a one-off request.
  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    begin
      r['item_inventory_ret']&.each do |qb|
        item = Item.new
        item[:full_name] = qb["full_name"]
        item[:sales_price] = qb["sales_price"]
        item[:purchase_cost] = qb["purchase_cost"]
        item[:is_inventory] = 1
        item.save
      end
      # r['item_non_inventory_ret']&.each{|qb|Rails.logger.warn(qb)}
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end


#
# Inventory:
#       :name => "name",
# #     :full_name => "full_name",
# #     :sales_desc => "sales_desc",
# #     :sales_price => "sales_price",
# #     :purchase_desc => "purchase_desc",
# #     :purchase_cost => "purchase_cost"
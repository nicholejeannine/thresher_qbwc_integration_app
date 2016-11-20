class ListItemSalesTaxWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :item_sales_tax_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" }
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get item_sales_taxs in groups of 100. When this is 0, we're done.
    # complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = ItemSalesTax.column_names
    response['item_sales_tax_ret'].each do |qb|
      item_sales_tax = ItemSalesTax.find_or_initialize_by(:id => qb['list_id'])
      qb.to_hash.each do |key, value|
      if columns.include?(key.to_s)
            item_sales_tax.send("#{key}=", value)
       elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k.match /id$/
              name = key.sub(/ref$/, "id").sub(/ret$/, "id")
              item_sales_tax.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'owner_id'
          end # end value.each do |k,v|
        end # end if value is hash
      end # end each
      if item_sales_tax.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{item_sales_tax.errors}")
      end # end if item_sales_tax save
    end # end for each item_sales_tax
  end # end handle response
end # end worker class
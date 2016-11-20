class ListInventorySiteWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :inventory_site_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get inventory_sites in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = InventorySite.column_names
    response['inventory_site_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      inventory_site = InventorySite.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          inventory_site.send("#{key}_addr1=", value['addr1'])
          inventory_site.send("#{key}_addr2=", value['addr2'])
          inventory_site.send("#{key}_addr3=", value['addr3'])
          inventory_site.send("#{key}_addr4=", value['addr4'])
          inventory_site.send("#{key}_addr5=", value['addr5'])
          inventory_site.send("#{key}_city=", value['city'])
          inventory_site.send("#{key}_state=", value['state'])
          inventory_site.send("#{key}_postal_code=", value['postal_code'])
          inventory_site.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              inventory_site.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            inventory_site.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if inventory_site.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{inventory_site.errors}")
      end # end if inventory_site save
    end # end for each inventory_site
  end # end handle response
end # end worker class

class ListAdditionalNoteWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :additional_note_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get additional_notes in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = AdditionalNote.column_names
    response['additional_note_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      additional_note = AdditionalNote.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          additional_note.send("#{key}_addr1=", value['addr1'])
          additional_note.send("#{key}_addr2=", value['addr2'])
          additional_note.send("#{key}_addr3=", value['addr3'])
          additional_note.send("#{key}_addr4=", value['addr4'])
          additional_note.send("#{key}_addr5=", value['addr5'])
          additional_note.send("#{key}_city=", value['city'])
          additional_note.send("#{key}_state=", value['state'])
          additional_note.send("#{key}_postal_code=", value['postal_code'])
          additional_note.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              additional_note.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            additional_note.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if additional_note.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{additional_note.errors}")
      end # end if additional_note save
    end # end for each additional_note
  end # end handle response
end # end worker class

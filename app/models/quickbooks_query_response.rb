class QuickbooksQueryResponse < Qbxml::Hash
  include QuickbooksTypes

  def self.parse(hash, klass, id)
    default = klass.default_hash
    hash = self.from_hash(hash)
    hash.reject!{|k|ignored_type?(k)}
    hash.each do |key, value|
      if key.match(/(\A[a-z]*)_address$/)
        value.each do |k,v|
          default["#{$1}_#{k}"] = v
        end
      elsif key.match(/(.*)_ref$/)
        if $1 == 'parent'
          default["parent_list_id"] = value["list_id"]
        elsif $1 == 'vendor'
          default["vendor_name"] = value["full_name"]
        elsif $1 == 'customer'
          default["customer_full_name"] = value["full_name"]
        else
          default["#{$1}"] = value['full_name']
        end
      elsif key.match(/data_ext_ret/)
        value&.each do |arr|
          name = arr['data_ext_name'].remove(" ").underscore
          default["#{name}"] = arr["data_ext_value"]
        end
      elsif key.match(/line_ret$/)
        klass.process_line_items(value, id)
      elsif key.match(/linked_txn|applied_to_txn_ret/)
        klass.parse_linked_txn(value, id)
      end
    end
    default.merge!(hash)
    default.select{|k|klass.is_valid_key?(k)}
  end
end
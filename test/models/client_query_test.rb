require 'test_helper'
require 'fixtures/client_hash'

class ClientQueryTest < ActiveSupport::TestCase
  include ClientHash


  test "when processing the query request, it updates the correct fields" do
    
  end
  
  def setup
    Customer.parse_customer_response(qb_hash)
  end


  


end
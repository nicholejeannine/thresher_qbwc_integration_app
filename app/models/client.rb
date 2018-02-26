class Client < ApplicationRecord
  self.table_name = "Customers"
  self.primary_key = "Customers_PKEY"
  
  def self.save_to_portal qb
    customer = self.where("Cust_CompanyAbr", qb['full_name'])&.first
    
    # If customer if found, save the qb fields to their corresponding Thresher fields.
    
    # IF CUSTOMER IS NOT FOUND, handle it. (This part of the code will change - we may write the customer to an error table, but later when people can NO LONGER enter new clients into the portal, we need to quickly switch to a method that permits new records to be saved to the table. We can simply swap out the "error handler" here.)
    #
    
  end
end

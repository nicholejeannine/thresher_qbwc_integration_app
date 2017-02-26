module QuickbooksUtils
	extend ActiveSupport::Concern

	def is_address(key)
		key.match /ship_address$|bill_address$|block$/
	end

	def ref_type(key)
		key.remove(/_ref$/).match /customer_type$|terms$|sales_rep|sales_tax_code|item_sales_tax$|preferred_payment_method$|job_type$|price_level$/
	end

end

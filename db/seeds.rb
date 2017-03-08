# Don't seed anything in production! Leave the data there alone!
unless Rails.env.production?
 connection = ActiveRecord::Base.connection
 # load data from data file if it exists
  if File.exists?('db/data/data.sql')
    sql = File.read('db/data/data.sql')
    statements = sql.split(/;$/)
    statements.pop
    ActiveRecord::Base.transaction do
      statements.each do |statement|
        connection.execute(statement)
      end
    end
  end
 # User.create([{id: 1, email: 'nklerk@alopias.com', username: 'nklerk', password: 'password'}])

 # clear quickbooks jobs
  QBWC.clear_jobs
  QBWC.add_job(:list_customers, true, '', CustomerQueryWorker)
 # QBWC.add_job(:list_estimates, true, '', EstimateQueryWorker)
 # QBWC.add_job(:list_sales_orders, true, '', SalesOrderQueryWorker)
 # QBWC.add_job(:list_purchase_orders, true, '', PurchaseOrderQueryWorker)
 # QBWC.add_job(:list_invoices, true, '', InvoiceQueryWorker)
end

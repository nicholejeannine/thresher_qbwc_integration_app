# DB MODS:

1. Dead weight or check:

- clients:
  - bill_addr5
  - ship_addr5
  - balance
  - job_type
  
- jobs:
 - addr5, balance
 
- projects
  - addr5, balance
  - contact/alt_contact?
  - job_projected_end_date
  - job_end_date
  
- estimates:
  - addr5
  - po_number
  - fob
  
- estimate_lines:
  - inventory_site_location

- sales_orders:
   - addr5
   - fob
   - ship_method
   
- sales_order_lines:
  - inventory_site_location
  - serial_number
  - lot_number
  
- purchase_orders:
   - addr5
   - ship_method
   - fob
   
- purchase_order_lines:
  - inventory_site_location
  - service_date

- invoices:
 - addr5
 - is_pending
 - is_finance_charge
 - fob
 - suggested_discount_amount (used once in 2011)
 - suggested_discount_date (used once in 2011)

invoice_lines:
 - inventory_site_location
 - serial_number
 - lot_number

payments:
  - ar_account (always says "Accounts Receiveable")
  
vendor:
   - addr5

# Things to ErrorLog:

1. Projects without related QB record
1. QB projects without a related Portal record (working)
1. SOs without an estimate
1. POs without an estimate
1. Invoices without an SO
1. ReceivePayments without an invoice


# Going Forward:
1. Estimate parent should be a project. (not client/job)
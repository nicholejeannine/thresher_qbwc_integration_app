# DB MODS:

1. Dead weight or check:

- clients:
  
- jobs:
 
- projects
  - contact/alt_contact?
  - job_projected_end_date
  - job_end_date
  
- estimate_lines:

- sales_orders:
   - ship_method
   
- sales_order_lines:
  - serial_number
  - lot_number
  

  
vendor:

# Things to ErrorLog:

1. Projects without related QB record
1. QB projects without a related Portal record (working)
1. SOs without an estimate
1. POs without an estimate
1. Invoices without an SO
1. ReceivePayments without an invoice


# Going Forward:
1. Estimate parent should be a project. (not client/job)
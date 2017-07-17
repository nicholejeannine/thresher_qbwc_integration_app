# DB MODS:


1. Strip out sublevel
1. Change "parent" back to parent_id for jobs and projects (or "parent list id"?)
1. Strip out estimate_id from invoice

# Things to ErrorLog:

1. Projects without related QB record
1. QB projects without a related Portal record (working)
1. SOs without an estimate
1. POs without an estimate
1. Invoices without an SO
1. ReceivePayments without an invoice


# Going Forward:
1. Estimate parent should be a project. (not client/job)
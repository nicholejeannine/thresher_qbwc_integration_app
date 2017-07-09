require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "can parse a simple hash" do
    assert_equal(1, Invoice.count, "should equal one")
    assert_equal(7, InvoiceLine.count, "should parse lines")

  end
  
  
  def setup
    InvoiceLine.destroy_all
    Invoice.destroy_all
    qb_hash = {"xml_attributes" => {}, "txn_id" => "53D53B-1497636612", "time_created" => "2017-06-16T11:10:12-08:00", "time_modified" => "2017-06-16T11:14:13-08:00", "edit_sequence" => "1497636853", "txn_number" => 183885, "customer_ref" => {"xml_attributes" => {}, "list_id" => "8000191F-1489513228", "full_name" => "Facebook:Construction:Menlo Park Campus:Bld 59:P-2872"}, "ar_account_ref" => {"xml_attributes" => {}, "list_id" => "380000-875338868", "full_name" => "Accounts Receivable"}, "template_ref" => {"xml_attributes" => {}, "list_id" => "10000-875338876", "full_name" => "ThresherStandard Invoice"}, "txn_date" => "2017-06-16", "ref_number" => "18370", "bill_address" => {"xml_attributes" => {}, "addr1" => "Peninsula Innovation Partners, ", "addr2" => "LLC", "addr3" => "1601 Willow Road", "city" => "Menlo Park", "state" => "CA", "postal_code" => "94025", "country" => "USA"}, "bill_address_block" => {"xml_attributes" => {}, "addr1" => "Peninsula Innovation Partners,", "addr2" => "LLC", "addr3" => "1601 Willow Road", "addr4" => "Menlo Park, CA 94025", "addr5" => "United States"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "Peninsula Innovation Partners, ", "addr2" => "LLC", "addr3" => "1220 Hamilton Ct.", "city" => "Menlo Park", "state" => "CA", "postal_code" => "94025", "country" => "USA"}, "ship_address_block" => {"xml_attributes" => {}, "addr1" => "Peninsula Innovation Partners,", "addr2" => "LLC", "addr3" => "1220 Hamilton Ct.", "addr4" => "Menlo Park, CA 94025", "addr5" => "United States"}, "is_pending" => false, "is_finance_charge" => false, "po_number" => "1076735", "terms_ref" => {"xml_attributes" => {}, "list_id" => "20000-875338872", "full_name" => "Net 30"}, "due_date" => "2017-07-16", "sales_rep_ref" => {"xml_attributes" => {}, "list_id" => "80000013-1462662489", "full_name" => "GJM"}, "ship_date" => "2017-06-16", "subtotal" => 6785.0, "item_sales_tax_ref" => {"xml_attributes" => {}, "list_id" => "10D0000-875338870", "full_name" => "SM/CA"}, "sales_tax_percentage" => 8.75, "sales_tax_total" => 593.69, "applied_amount" => 0.0, "balance_remaining" => 7378.69, "memo" => "Estimate 10544:", "is_paid" => false, "customer_msg_ref" => {"xml_attributes" => {}, "list_id" => "80000015-1391724709", "full_name" => "Main Phone:408.780.3066  \naccountsreceivable@alopias.com"}, "is_to_be_printed" => false, "is_to_be_emailed" => false, "customer_sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "other" => "MPK 59", "linked_txn" => [{"xml_attributes" => {}, "txn_id" => "53D529-1497631698", "txn_type" => "SalesOrder", "txn_date" => "2017-06-16", "ref_number" => "5677", "link_type" => "AMTTYPE", "amount" => -7378.69}], "invoice_line_ret" => [{"xml_attributes" => {}, "txn_line_id" => "53D53D-1497636612", "desc" => "Thresher considers all materials to be the property of Thresher until all invoices are paid in full. By accepting this invoice you are agreeing to the following terms: Please be aware that a 1.25% per week or 5.0% per month late fee will be charged for all invoices not paid with in the \"Net 30\" terms.  Thank you.\n"}, {"xml_attributes" => {}, "txn_line_id" => "53D53E-1497636612"}, {"xml_attributes" => {}, "txn_line_id" => "53D53F-1497636612", "desc" => "MPK 59 Added Items"}, {"xml_attributes" => {}, "txn_line_id" => "53D540-1497636612"}, {"xml_attributes" => {}, "txn_line_id" => "53D541-1497636612", "item_ref" => {"xml_attributes" => {}, "list_id" => "8000170C-1327517268", "full_name" => "Crestron:DM-TX-200-C-2G-W-T"}, "desc" => "Crestron - (White Textured)Wall Plate DigitalMedia 8G+\u0099 Transmitter 200", "quantity" => "#<BigDecimal:7fb136487530,'0.1E1',9(18)>", "rate" => 805.0, "amount" => 805.0, "inventory_site_ref" => {"xml_attributes" => {}, "list_id" => "80000001-1466284228", "full_name" => "234 E Caribbean"}, "service_date" => "2017-06-16", "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "other1" => "50-000065"}, {"xml_attributes" => {}, "txn_line_id" => "53D542-1497636612", "item_ref" => {"xml_attributes" => {}, "list_id" => "800014E7-1302503048", "full_name" => "Crestron:DM-RMC-200-C"}, "desc" => "Crestron - DigitalMedia 8G\u0099 STP Receiver & Room Controller 200", "quantity" => "#<BigDecimal:7fb13677ec20,'0.1E1',9(18)>", "rate" => 1150.0, "amount" => 1150.0, "inventory_site_ref" => {"xml_attributes" => {}, "list_id" => "80000001-1466284228", "full_name" => "234 E Caribbean"}, "service_date" => "2017-06-16", "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "other1" => "50-000062"}, {"xml_attributes" => {}, "txn_line_id" => "53D543-1497636612", "item_ref" => {"xml_attributes" => {}, "list_id" => "800030EC-1492805683", "full_name" => "Crestron:DM-PSU-ULTRA-MIDSPAN"}, "desc" => "Crestron-DigitalMedia\u0099 Ultra Midspan PoDM++ Injector", "quantity" => "#<BigDecimal:7fb136c72e70,'0.14E2',9(18)>", "rate" => 345.0, "amount" => 4830.0, "inventory_site_ref" => {"xml_attributes" => {}, "list_id" => "80000001-1466284228", "full_name" => "234 E Caribbean"}, "service_date" => "2017-06-16", "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}}]}
    Invoice.parse_qb_response(qb_hash)
  end

end

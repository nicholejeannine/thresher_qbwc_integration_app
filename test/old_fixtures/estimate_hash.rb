module EstimateHash
  extend ActiveSupport::Concern
  included do
    def qb_hash
      {"xml_attributes" => {}, "txn_id" => "53D7E5-1497890620", "time_created" => "2017-06-19T09:43:40-08:00", "time_modified" => "2017-06-19T09:45:27-08:00", "edit_sequence" => "1497890727", "txn_number" => 183940, "customer_ref" => {"xml_attributes" => {}, "list_id" => "80000F95-1427944431", "full_name" => "Box:Construction:Redwood City"}, "template_ref" => {"xml_attributes" => {}, "list_id" => "140000-1086230783", "full_name" => "Custom Estimate"}, "txn_date" => "2017-06-19", "ref_number" => "10634", "bill_address" => {"xml_attributes" => {}, "addr1" => "Box HQ", "addr2" => "4440 El Camino Real", "city" => "Los Altos", "state" => "CA", "postal_code" => "94022"}, "bill_address_block" => {"xml_attributes" => {}, "addr1" => "Box HQ", "addr2" => "4440 El Camino Real", "addr3" => "Los Altos, CA 94022"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "900 Jefferson Road", "addr2" => "Building A", "city" => "Redwood City", "state" => "CA", "postal_code" => "94063"}, "ship_address_block" => {"xml_attributes" => {}, "addr1" => "900 Jefferson Road", "addr2" => "Building A", "addr3" => "Redwood City, CA 94063"}, "is_active" => true, "due_date" => "2017-06-19", "sales_rep_ref" => {"xml_attributes" => {}, "list_id" => "8000000E-1398458241", "full_name" => "ARJ"}, "subtotal" => 14497.0, "item_sales_tax_ref" => {"xml_attributes" => {}, "list_id" => "10D0000-875338870", "full_name" => "SM/CA"}, "sales_tax_percentage" => 9.0, "sales_tax_total" => 478.53, "total_amount" => 14975.53, "is_to_be_emailed" => false, "customer_sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "other" => "RWC AHA Adds Value Eng", "estimate_line_ret" => [{"xml_attributes" => {}, "txn_line_id" => "53D7E7-1497890620", "desc" => "Adding Program Audio Speakers to AHA"}, {"xml_attributes" => {}, "txn_line_id" => "53D7E8-1497890620"}, {"xml_attributes" => {}, "txn_line_id" => "53D7E9-1497890620", "desc" => "Scope: Thresher will install [4] program speakers from the ceiling. Cabling will need to be routed to the first [2] and run for the rear [2]. These will be connected in the AV booth and selectable from the board to opporate independantly from the pendant speakers."}, {"xml_attributes" => {}, "txn_line_id" => "53D7EA-1497890620"}, {"xml_attributes" => {}, "txn_line_id" => "53D7EB-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "800018F6-1343668557", "full_name" => "Symetrix:Edge4AOut"}, "desc" => "Symetrix - 4 channel analogue output card", "quantity" => "#<BigDecimal:7fb1230c10d0,'0.1E1',9(18)>", "rate" => 179.0, "amount" => 232.7, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "markup_rate_percent" => 30.0}, {"xml_attributes" => {}, "txn_line_id" => "53D7EC-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "800031AF-1497890211", "full_name" => "QSC:AD-S282HT-BK"}, "desc" => "QSC - AD-S282HT-WH - Surface mount speaker, dual 8\" weather-resistant, 2-way, 90° x 60°\nrotatable, high power version, with 70V/100V transformer and 8 bypass, ships with yoke mount, BLACK", "quantity" => "#<BigDecimal:7fb12309f4a8,'0.4E1',9(18)>", "rate" => 525.0, "amount" => 2730.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "markup_rate_percent" => 30.0}, {"xml_attributes" => {}, "txn_line_id" => "53D7ED-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "800029A5-1433980185", "full_name" => "QSC:GX5"}, "desc" => "QSC - GX5 x 700W at 4 Ohms, 2 x 500W at 8 Ohms, Amp & Load Protection & Crossover Switch", "quantity" => "#<BigDecimal:7fb123075900,'0.1E1',9(18)>", "rate" => 299.0, "amount" => 388.7, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "markup_rate_percent" => 30.0}, {"xml_attributes" => {}, "txn_line_id" => "53D7EE-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "8000265C-1415385453", "full_name" => "Cable Equip:0100"}, "desc" => "AV infrastructure cabling and terminations", "quantity" => "#<BigDecimal:7fb123050448,'0.1E1',9(18)>", "rate" => 225.0, "amount" => 225.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "markup_rate_percent" => 0.0}, {"xml_attributes" => {}, "txn_line_id" => "53D7EF-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "8000265F-1415385940", "full_name" => "Cable Equip:0200"}, "desc" => "Inter-device connectors and adapters", "quantity" => "#<BigDecimal:7fb12300aab0,'0.1E1',9(18)>", "rate" => 75.0, "amount" => 75.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "markup_rate_percent" => 0.0}, {"xml_attributes" => {}, "txn_line_id" => "53D7F0-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "80000E2C-1218667550", "full_name" => "Subtotal"}, "amount" => 3651.4}, {"xml_attributes" => {}, "txn_line_id" => "53D7F1-1497890620"}, {"xml_attributes" => {}, "txn_line_id" => "53D7F2-1497890620", "desc" => "Adding in the ability to take in more than one DM source in the board. This will require wiring between the racks and re-programming of the board/DSP. Having DM sources simultaneously in both DIY and Yamaha Modes. Programming the DIY audio mixer onto the board. Adding Dante Stage Box"}, {"xml_attributes" => {}, "txn_line_id" => "53D7F3-1497890620"}, {"xml_attributes" => {}, "txn_line_id" => "53D7F4-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "80002DC2-1467993263", "full_name" => "Extron:60-804-01"}, "desc" => "Extron - Passive Audio Summing Adapter with RCA Inputs and Balanced/Unbalanced Output", "quantity" => "#<BigDecimal:7fb122fad3b0,'0.6E1',9(18)>", "rate" => 35.0, "amount" => 273.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "markup_rate_percent" => 30.0}, {"xml_attributes" => {}, "txn_line_id" => "53D7F5-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "80002DAD-1466793851", "full_name" => "Yamaha:Tio1608-D"}, "desc" => "Yamaha - 16 Input, 8 Output Dante Stage Box for TF series console", "quantity" => "#<BigDecimal:7fb122f875c0,'0.1E1',9(18)>", "rate" => 760.5, "amount" => 912.6, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "markup_rate_percent" => 20.0}, {"xml_attributes" => {}, "txn_line_id" => "53D7F6-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "8000265C-1415385453", "full_name" => "Cable Equip:0100"}, "desc" => "AV infrastructure cabling and terminations", "quantity" => "#<BigDecimal:7fb122f6db48,'0.1E1',9(18)>", "rate" => 175.0, "amount" => 175.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "markup_rate_percent" => 0.0}, {"xml_attributes" => {}, "txn_line_id" => "53D7F7-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "8000265F-1415385940", "full_name" => "Cable Equip:0200"}, "desc" => "Inter-device connectors and adapters", "quantity" => "#<BigDecimal:7fb122f48578,'0.1E1',9(18)>", "rate" => 125.0, "amount" => 125.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "markup_rate_percent" => 0.0}, {"xml_attributes" => {}, "txn_line_id" => "53D7F8-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "80000E2C-1218667550", "full_name" => "Subtotal"}, "amount" => 1485.6}, {"xml_attributes" => {}, "txn_line_id" => "53D7F9-1497890620"}, {"xml_attributes" => {}, "txn_line_id" => "53D7FA-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "31A0000-989981084", "full_name" => "Video:0100"}, "desc" => "AV installation labor", "quantity" => "#<BigDecimal:7fb122f20168,'0.1E1',9(18)>", "rate" => 5880.0, "amount" => 5880.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "20000-1009221895", "full_name" => "Non"}}, {"xml_attributes" => {}, "txn_line_id" => "53D7FB-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "8000265A-1415385016", "full_name" => "Video:0550"}, "desc" => "Audio programming & tuning", "quantity" => "#<BigDecimal:7fb122ef8c80,'0.1E1',9(18)>", "rate" => 980.0, "amount" => 980.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "20000-1009221895", "full_name" => "Non"}}, {"xml_attributes" => {}, "txn_line_id" => "53D7FC-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "80002659-1415384901", "full_name" => "Video:0540"}, "desc" => "Control system programming", "quantity" => "#<BigDecimal:7fb122ee9a50,'0.1E1',9(18)>", "rate" => 700.0, "amount" => 700.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "20000-1009221895", "full_name" => "Non"}}, {"xml_attributes" => {}, "txn_line_id" => "53D7FD-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "80002B22-1446489922", "full_name" => "Video:0130"}, "desc" => "Commissioning", "quantity" => "#<BigDecimal:7fb122eca470,'0.1E1',9(18)>", "rate" => 420.0, "amount" => 420.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "20000-1009221895", "full_name" => "Non"}}, {"xml_attributes" => {}, "txn_line_id" => "53D7FE-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "80000E2C-1218667550", "full_name" => "Subtotal"}, "amount" => 7980.0}, {"xml_attributes" => {}, "txn_line_id" => "53D7FF-1497890620"}, {"xml_attributes" => {}, "txn_line_id" => "53D800-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "A10001-875338869", "full_name" => "Shipping"}, "desc" => "Shipping charges", "quantity" => "#<BigDecimal:7fb122ea6ef8,'0.1E1',9(18)>", "rate" => 180.0, "amount" => 180.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}}, {"xml_attributes" => {}, "txn_line_id" => "53D801-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "80002657-1415384870", "full_name" => "Video:0530"}, "desc" => "Schematic Updates", "quantity" => "#<BigDecimal:7fb122e83b60,'0.1E1',9(18)>", "rate" => 700.0, "amount" => 700.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "20000-1009221895", "full_name" => "Non"}}, {"xml_attributes" => {}, "txn_line_id" => "53D802-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "31D0000-989981196", "full_name" => "Video:0400"}, "desc" => "Project Management", "quantity" => "#<BigDecimal:7fb122e70448,'0.1E1',9(18)>", "rate" => 500.0, "amount" => 500.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "20000-1009221895", "full_name" => "Non"}}, {"xml_attributes" => {}, "txn_line_id" => "53D803-1497890620", "item_ref" => {"xml_attributes" => {}, "list_id" => "80000E2C-1218667550", "full_name" => "Subtotal"}, "amount" => 1380.0}]}
    end


  end
end
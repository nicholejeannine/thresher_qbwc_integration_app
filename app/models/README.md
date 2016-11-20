# Scaffolds

rails g scaffold ARRefundCreditCard time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_id refund_from_account_id ar_account_id txn_date:date ref_number total_amount:decimal{'15,2'} currency_id exchange_rate:float total_amount_in_home_currency:decimal{'15,2'} address payment_method_id memo:text credit_card_txn_info external_guid refund_applied_to_txn_id data_ext_id


rails g scaffold Account time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean parent_id sublevel:integer account_type detail_account_type special_account_type is_tax_account:boolean account_number bank_number last_check_number desc balance:decimal{'15,2'} total_balance:decimal{'15,2'} sales_tax_code_id tax_line_info_id cash_flow_classification currency_id data_ext_id


rails g scaffold AccountTaxLineInfo tax_line_id:integer tax_line_name


rails g scaffold AdditionalNote note_id:integer date:date note:text


rails g scaffold AppliedToTxn txn_type txn_date:date ref_number balance_remaining:decimal{'15,2'} amount:decimal{'15,2'} txn_line_detail discount_amount:decimal{'15,2'} discount_account_id discount_class_id linked_txn


rails g scaffold BarCode list_type full_name


rails g scaffold BillPaymentCheck time_created:datetime time_modified:datetime edit_sequence txn_number:integer payee_entity_id ap_account_id txn_date:date bank_account_id amount:decimal{'15,2'} currency_id exchange_rate:float amount_in_home_currency:decimal{'15,2'} ref_number memo:text address is_to_be_printed:boolean external_guid applied_to_txn_id data_ext_id


rails g scaffold BillPaymentCreditCard time_created:datetime time_modified:datetime edit_sequence txn_number:integer payee_entity_id ap_account_id txn_date:date credit_card_account_id amount:decimal{'15,2'} currency_id exchange_rate:float amount_in_home_currency:decimal{'15,2'} ref_number memo:text external_guid applied_to_txn_id data_ext_id


rails g scaffold Bill time_created:datetime time_modified:datetime edit_sequence txn_number:integer vendor_id vendor_address ap_account_id txn_date:date due_date:date amount_due:decimal{'15,2'} currency_id exchange_rate:float amount_due_in_home_currency:decimal{'15,2'} ref_number terms_id memo:text is_tax_included:boolean sales_tax_code_id is_paid:boolean external_guid linked_txn expense_line_id item_line_id item_group_line_id open_amount:decimal{'15,2'} data_ext_id


rails g scaffold BillToPay bill_to_pay credit_to_apply


rails g scaffold BillingRatePerItem item_id custom_rate custom_rate_percent:float


rails g scaffold BillingRate time_created:datetime time_modified:datetime edit_sequence name billing_rate_type fixed_billing_rate billing_rate_per_item_id


rails g scaffold BuildAssembly time_created:datetime time_modified:datetime edit_sequence txn_number:integer item_inventory_assembly_id inventory_site_id inventory_site_location_id serial_number lot_number txn_date:date ref_number memo:text is_pending:boolean quantity_to_build quantity_can_build quantity_on_hand quantity_on_sales_order external_guid component_item_line_id data_ext_id


rails g scaffold CashBackInfo account_id memo:text amount:decimal{'15,2'}


rails g scaffold Charge time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_id txn_date:date ref_number item_id inventory_site_id inventory_site_location_id quantity unit_of_measure override_uom_set_id rate amount:decimal{'15,2'} balance_remaining:decimal{'15,2'} desc ar_account_id class_id billed_date:date due_date:date is_paid:boolean external_guid linked_txn data_ext_id


rails g scaffold Check time_created:datetime time_modified:datetime edit_sequence txn_number:integer account_id payee_entity_id ref_number txn_date:date amount:decimal{'15,2'} currency_id exchange_rate:float amount_in_home_currency:decimal{'15,2'} memo:text address is_to_be_printed:boolean is_tax_included:boolean sales_tax_code_id external_guid linked_txn expense_line_id item_line_id item_group_line_id data_ext_id


rails g scaffold Class time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean parent_id sublevel:integer


rails g scaffold CompanyActivity last_restore_time:datetime last_condense_time:datetime


rails g scaffold Company is_sample_company:boolean company_name legal_company_name address legal_address company_address_for_customer company_address_block_for_customer phone fax email company_email_for_customer company_web_site first_month_fiscal_year first_month_income_tax_year company_type ein ssn tax_form subscribed_services accountant_copy data_ext_id


rails g scaffold ComponentItemLine item_id inventory_site_id inventory_site_location_id serial_number lot_number desc quantity_on_hand quantity_needed


rails g scaffold Contact time_created:datetime time_modified:datetime edit_sequence contact salutation first_name middle_name last_name job_title additional_contact_id


rails g scaffold CreditCardCharge time_created:datetime time_modified:datetime edit_sequence txn_number:integer account_id payee_entity_id txn_date:date amount:decimal{'15,2'} currency_id exchange_rate:float amount_in_home_currency:decimal{'15,2'} ref_number memo:text is_tax_included:boolean sales_tax_code_id external_guid expense_line_id item_line_id item_group_line_id data_ext_id


rails g scaffold CreditCardCredit time_created:datetime time_modified:datetime edit_sequence txn_number:integer account_id payee_entity_id txn_date:date amount:decimal{'15,2'} currency_id exchange_rate:float amount_in_home_currency:decimal{'15,2'} ref_number memo:text is_tax_included:boolean sales_tax_code_id external_guid expense_line_id item_line_id item_group_line_id data_ext_id


rails g scaffold CreditMemoLineGroup item_group_id desc quantity unit_of_measure override_uom_set_id is_print_items_in_group:boolean total_amount:decimal{'15,2'} service_date:date credit_memo_line_id data_ext_id


rails g scaffold CreditMemoLine item_id desc quantity unit_of_measure override_uom_set_id rate rate_percent:float class_id amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_id inventory_site_location_id serial_number lot_number service_date:date sales_tax_code_id is_taxable:boolean other1 other2 credit_card_txn_info data_ext_id


rails g scaffold CreditMemo time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_id class_id ar_account_id template_id txn_date:date ref_number bill_address_addr1 bill_address_addr2 bill_address_addr3 bill_address_addr4 bill_address_addr5 bill_address_city bill_address_state bill_address_postal_code bill_address_country bill_address_note ship_address_addr1 ship_address_addr2 ship_address_addr3 ship_address_addr4 ship_address_addr5 ship_address_city ship_address_state ship_address_postal_code ship_address_country ship_address_note is_pending:boolean po_number terms_id due_date:date sales_rep_id fob ship_date:date ship_method_id subtotal:decimal{'15,2'} item_sales_tax_id sales_tax_percentage:float sales_tax_total:decimal{'15,2'} total_amount:decimal{'15,2'} credit_remaining:decimal{'15,2'} currency_id exchange_rate:float credit_remaining_in_home_currency:decimal{'15,2'} memo:text customer_msg_id is_to_be_printed:boolean is_to_be_emailed:boolean is_tax_included:boolean customer_sales_tax_code_id other external_guid linked_txn credit_memo_line_id credit_memo_line_group_id discount_line_id sales_tax_line_id shipping_line_id data_ext_id


rails g scaffold Currency time_created:datetime time_modified:datetime edit_sequence name is_active:boolean currency_code currency_format is_user_defined_currency:boolean exchange_rate:float as_of_date:date


rails g scaffold CustomerMsg time_created:datetime time_modified:datetime edit_sequence name is_active:boolean


rails g scaffold Customer time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean class_id parent_id sublevel:integer company_name salutation first_name middle_name last_name suffix job_title bill_address_addr1 bill_address_addr2 bill_address_addr3 bill_address_addr4 bill_address_addr5 bill_address_city bill_address_state bill_address_postal_code bill_address_country bill_address_note ship_address_addr1 ship_address_addr2 ship_address_addr3 ship_address_addr4 ship_address_addr5 ship_address_city ship_address_state ship_address_postal_code ship_address_country ship_address_note print_as phone mobile pager alt_phone fax email cc contact alt_contact additional_contact_id contacts_id customer_type_id terms_id sales_rep_id balance:decimal{'15,2'} total_balance:decimal{'15,2'} sales_tax_code_id item_sales_tax_id sales_tax_country resale_number account_number credit_limit:decimal{'15,2'} preferred_payment_method_id credit_card_info job_status job_start_date:date job_projected_end_date:date job_end_date:date job_desc job_type_id notes:text additional_notes_id is_statement_with_parent:boolean delivery_method preferred_delivery_method price_level_id external_guid tax_registration_number currency_id data_ext_id


rails g scaffold CustomerType time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean parent_id sublevel:integer


rails g scaffold DataEventRecoveryInfo subscriber_id data_event_recovery_time:datetime


rails g scaffold DataEventSubscription subscriber_id time_created:datetime time_last_processed:datetime com_callback_info delivery_policy track_lost_events deliver_own_events:boolean list_event_subscription txn_event_subscription


rails g scaffold DataExtDefDel owner_id data_ext_name time_deleted:datetime


rails g scaffold DataExtDef owner_id data_ext_id:integer data_ext_name data_ext_type assign_to_object data_ext_list_require:boolean data_ext_txn_require:boolean data_ext_format_string


rails g scaffold DataExtDel owner_id data_ext_name list_data_ext_type list_obj_id txn_data_ext_type other_data_ext_type time_deleted:datetime


rails g scaffold DataExt owner_id data_ext_name data_ext_type data_ext_value


rails g scaffold DateDrivenTerm time_created:datetime time_modified:datetime edit_sequence name is_active:boolean day_of_month_due:integer due_next_month_days:integer discount_day_of_month:integer discount_pct:float


rails g scaffold DepositLine txn_type entity_id account_id memo:text check_number payment_method_id class_id amount:decimal{'15,2'}


rails g scaffold Deposit time_created:datetime time_modified:datetime edit_sequence txn_number:integer txn_date:date deposit_to_account_id memo:text deposit_total:decimal{'15,2'} currency_id exchange_rate:float deposit_total_in_home_currency:decimal{'15,2'} cash_back_info_id external_guid deposit_line_id data_ext_id


rails g scaffold DiscountLine amount:decimal{'15,2'} rate_percent:float is_taxable:boolean account_id


rails g scaffold Employee time_created:datetime time_modified:datetime edit_sequence name is_active:boolean salutation first_name middle_name last_name suffix job_title supervisor_id department description target_bonus:decimal{'15,2'} employee_address print_as phone mobile pager pager_pin alt_phone fax ssn email additional_contact_id emergency_contacts employee_type part_or_full_time exempt key_employee gender hired_date:date original_hire_date:date adjusted_service_date:date released_date:date birth_date:date us_citizen ethnicity disabled disability_desc on_file work_auth_expire_date:date us_veteran military_status account_number notes:text additional_notes_id billing_rate_id employee_payroll_info external_guid data_ext_id


rails g scaffold EstimateLineGroup item_group_id desc quantity unit_of_measure override_uom_set_id is_print_items_in_group:boolean total_amount:decimal{'15,2'} estimate_line_id data_ext_id


rails g scaffold EstimateLine item_id desc quantity unit_of_measure override_uom_set_id rate rate_percent:float class_id amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_id inventory_site_location_id sales_tax_code_id markup_rate markup_rate_percent:float other1 other2 data_ext_id


rails g scaffold Estimate time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_id class_id template_id txn_date:date ref_number bill_address_addr1 bill_address_addr2 bill_address_addr3 bill_address_addr4 bill_address_addr5 bill_address_city bill_address_state bill_address_postal_code bill_address_country bill_address_note ship_address_addr1 ship_address_addr2 ship_address_addr3 ship_address_addr4 ship_address_addr5 ship_address_city ship_address_state ship_address_postal_code ship_address_country ship_address_note is_active:boolean po_number terms_id due_date:date sales_rep_id fob subtotal:decimal{'15,2'} item_sales_tax_id sales_tax_percentage:float sales_tax_total:decimal{'15,2'} total_amount:decimal{'15,2'} currency_id exchange_rate:float total_amount_in_home_currency:decimal{'15,2'} memo:text customer_msg_id is_to_be_emailed:boolean is_tax_included:boolean customer_sales_tax_code_id other external_guid linked_txn estimate_line_id estimate_line_group_id data_ext_id


rails g scaffold ExpenseLine account_id amount:decimal{'15,2'} tax_amount:decimal{'15,2'} memo:text customer_id class_id sales_tax_code_id billable_status sales_rep_id data_ext_id


rails g scaffold Form1099CategoryAccountMapping is_filing1099_misc:boolean category_account_mapping


rails g scaffold Host product_name major_version minor_version country supported_qbxml_version is_automatic_login:boolean qb_file_mode list_meta_data


rails g scaffold InventoryAdjustmentLine item_id serial_number serial_number_added_or_removed lot_number inventory_site_location_id quantity_difference value_difference:decimal{'15,2'}


rails g scaffold InventoryAdjustment time_created:datetime time_modified:datetime edit_sequence txn_number:integer account_id inventory_site_id txn_date:date ref_number customer_id class_id memo:text external_guid inventory_adjustment_line_id data_ext_id


rails g scaffold InventorySite time_created:datetime time_modified:datetime edit_sequence name is_active:boolean parent_site_id is_default_site:boolean site_desc contact phone fax email site_address


rails g scaffold InvoiceLineGroup item_group_id desc quantity unit_of_measure override_uom_set_id is_print_items_in_group:boolean total_amount:decimal{'15,2'} service_date:date invoice_line_id data_ext_id


rails g scaffold InvoiceLine item_id desc quantity unit_of_measure override_uom_set_id rate rate_percent:float class_id amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_id inventory_site_location_id serial_number lot_number service_date:date sales_tax_code_id is_taxable:boolean other1 other2 data_ext_id


rails g scaffold Invoice time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_id class_id ar_account_id template_id txn_date:date ref_number bill_address_addr1 bill_address_addr2 bill_address_addr3 bill_address_addr4 bill_address_addr5 bill_address_city bill_address_state bill_address_postal_code bill_address_country bill_address_note ship_address_addr1 ship_address_addr2 ship_address_addr3 ship_address_addr4 ship_address_addr5 ship_address_city ship_address_state ship_address_postal_code ship_address_country ship_address_note is_pending:boolean is_finance_charge:boolean po_number terms_id due_date:date sales_rep_id fob ship_date:date ship_method_id subtotal:decimal{'15,2'} item_sales_tax_id sales_tax_percentage:float sales_tax_total:decimal{'15,2'} applied_amount:decimal{'15,2'} balance_remaining:decimal{'15,2'} currency_id exchange_rate:float balance_remaining_in_home_currency:decimal{'15,2'} memo:text is_paid:boolean customer_msg_id is_to_be_printed:boolean is_to_be_emailed:boolean is_tax_included:boolean customer_sales_tax_code_id suggested_discount_amount:decimal{'15,2'} suggested_discount_date:date other external_guid linked_txn invoice_line_id invoice_line_group_id discount_line_id sales_tax_line_id shipping_line_id data_ext_id


rails g scaffold ItemAssembliesCanBuild item_inventory_assembly_id txn_date:date quantity_can_build


rails g scaffold ItemDiscount time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_id parent_id sublevel:integer item_desc sales_tax_code_id discount_rate discount_rate_percent:float account_id external_guid data_ext_id


rails g scaffold ItemFixedAsset time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean class_id acquired_as purchase_desc purchase_date:date purchase_cost vendor_or_payee_name asset_account_id fixed_asset_sales_info asset_desc location po_number serial_number warranty_exp_date:date notes:text asset_number cost_basis:decimal{'15,2'} year_end_accumulated_depreciation:decimal{'15,2'} year_end_book_value:decimal{'15,2'} external_guid data_ext_id


rails g scaffold ItemGroupLine item_group_id desc quantity unit_of_measure override_uom_set_id total_amount:decimal{'15,2'} item_line_id data_ext


rails g scaffold ItemGroup time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean item_desc unit_of_measure_set_id is_print_items_in_group:boolean special_item_type external_guid item_group_line data_ext_id


rails g scaffold ItemInventoryAssembly time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_id parent_id sublevel:integer manufacturer_part_number unit_of_measure_set_id is_tax_included:boolean sales_tax_code_id sales_desc sales_price income_account_id purchase_desc purchase_cost purchase_tax_code_id cogs_account_id pref_vendor_id asset_account_id build_point max quantity_on_hand average_cost quantity_on_order quantity_on_sales_order external_guid item_inventory_assembly_line data_ext_id


rails g scaffold ItemInventory time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_id parent_id sublevel:integer manufacturer_part_number unit_of_measure_set_id is_tax_included:boolean sales_tax_code_id sales_desc sales_price income_account_id purchase_desc purchase_cost purchase_tax_code_id cogs_account_id pref_vendor_id asset_account_id reorder_point max quantity_on_hand average_cost quantity_on_order quantity_on_sales_order external_guid data_ext_id


rails g scaffold ItemLine item_id inventory_site_id inventory_site_location_id serial_number lot_number desc quantity unit_of_measure override_uom_set_id cost amount:decimal{'15,2'} tax_amount:decimal{'15,2'} customer_id class_id sales_tax_code_id billable_status sales_rep_id data_ext_id


rails g scaffold ItemNonInventory time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_id parent_id sublevel:integer manufacturer_part_number unit_of_measure_set_id is_tax_included:boolean sales_tax_code_id sales_or_purchase sales_and_purchase external_guid data_ext_id


rails g scaffold ItemOtherCharge time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_id parent_id sublevel:integer is_tax_included:boolean sales_tax_code_id sales_or_purchase sales_and_purchase special_item_type external_guid data_ext_id


rails g scaffold ItemPayment time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean class_id item_desc deposit_to_account_id payment_method_id external_guid data_ext_id


rails g scaffold ItemReceipt time_created:datetime time_modified:datetime edit_sequence txn_number:integer vendor_id ap_account_id liability_account_id txn_date:date total_amount:decimal{'15,2'} currency_id exchange_rate:float total_amount_in_home_currency:decimal{'15,2'} ref_number memo:text is_tax_included:boolean sales_tax_code_id external_guid linked_txn expense_line_id item_line_id item_group_line_id data_ext_id


rails g scaffold ItemSalesTaxGroup time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean item_desc external_guid item_sales_tax_id data_ext_id


rails g model ItemSalesTax time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean class_id item_desc tax_rate:float tax_vendor_id sales_tax_return_line_id external_guid data_ext_id


rails g scaffold ItemService time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_id parent_id sublevel:integer unit_of_measure_set_id is_tax_included:boolean sales_tax_code_id sales_or_purchase sales_and_purchase external_guid data_ext_id


rails g scaffold ItemSite time_created:datetime time_modified:datetime edit_sequence item_inventory_assembly_id item_inventory_id inventory_site_id inventory_site_location_id reorder_level quantity_on_hand quantity_on_purchase_orders quantity_on_sales_orders quantity_to_be_built_by_pending_build_txns quantity_required_by_pending_build_txns quantity_on_pending_transfers assembly_build_point


rails g scaffold ItemSubtotal time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean item_desc special_item_type external_guid data_ext_id


rails g scaffold JobType time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean parent_id sublevel:integer


rails g scaffold JournalEntry time_created:datetime time_modified:datetime edit_sequence txn_number:integer txn_date:date ref_number memo:text is_adjustment:boolean is_home_currency_adjustment:boolean is_amounts_entered_in_home_currency:boolean currency_id exchange_rate:float external_guid journal_debit_line journal_credit_line data_ext_id


rails g scaffold LeadContact lead_contact_id:integer salutation first_name middle_name last_name job_title additional_contact_id is_primary_contact:boolean


rails g scaffold Lead time_created:datetime time_modified:datetime edit_sequence full_name status company_name main_phone additional_contact_id locations_id lead_contacts_id


rails g scaffold ListDeleted list_del_type time_created:datetime time_deleted:datetime full_name


rails g scaffold Location location_id:integer main_address location lead_address


rails g scaffold OtherName time_created:datetime time_modified:datetime edit_sequence name is_active:boolean company_name salutation first_name middle_name last_name other_name_address phone alt_phone fax email contact alt_contact account_number notes:text external_guid data_ext_id


rails g scaffold PaymentMethod time_created:datetime time_modified:datetime edit_sequence name is_active:boolean payment_method_type


rails g scaffold PayrollItemNonWage time_created:datetime time_modified:datetime edit_sequence name is_active:boolean non_wage_type expense_account_id liability_account_id


rails g scaffold PayrollItemWage time_created:datetime time_modified:datetime edit_sequence name is_active:boolean wage_type expense_account_id


rails g scaffold PayrollLastPeriod period_start_date:date period_end_date:date


rails g scaffold Preference accounting_preferences finance_charge_preferences jobs_and_estimates_preferences multi_currency_preferences multi_location_inventory_preferences purchases_and_vendors_preferences reports_preferences sales_and_customers_preferences sales_tax_preferences time_tracking_preferences current_app_access_rights items_and_inventory_preferences


rails g scaffold PriceLevelPerItem item_id custom_price custom_price_percent:float


rails g scaffold PriceLevel time_created:datetime time_modified:datetime edit_sequence name is_active:boolean price_level_type price_level_fixed_percentage:float price_level_per_item_id currency_id


rails g scaffold PurchaseOrderLineGroup item_group_id desc quantity unit_of_measure override_uom_set_id is_print_items_in_group:boolean total_amount:decimal{'15,2'} service_date:date purchase_order_line_id data_ext_id


rails g scaffold PurchaseOrderLine item_id manufacturer_part_number desc quantity unit_of_measure override_uom_set_id rate class_id amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_location_id customer_id service_date:date sales_tax_code_id received_quantity unbilled_quantity is_billed:boolean is_manually_closed:boolean other1 other2 data_ext_id


rails g scaffold PurchaseOrder time_created:datetime time_modified:datetime edit_sequence txn_number:integer vendor_id class_id inventory_site_id ship_to_entity_id template_id txn_date:date ref_number vendor_address ship_address_addr1 ship_address_addr2 ship_address_addr3 ship_address_addr4 ship_address_addr5 ship_address_city ship_address_state ship_address_postal_code ship_address_country ship_address_note terms_id due_date:date expected_date:date ship_method_id fob total_amount:decimal{'15,2'} currency_id exchange_rate:float total_amount_in_home_currency:decimal{'15,2'} is_manually_closed:boolean is_fully_received:boolean memo:text vendor_msg is_to_be_printed:boolean is_to_be_emailed:boolean is_tax_included:boolean sales_tax_code_id other1 other2 external_guid linked_txn purchase_order_line_id purchase_order_line_group_id data_ext_id


rails g scaffold ReceivePayment time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_id ar_account_id txn_date:date ref_number total_amount:decimal{'15,2'} currency_id exchange_rate:float total_amount_in_home_currency:decimal{'15,2'} payment_method_id memo:text deposit_to_account_id credit_card_txn_info unused_payment:decimal{'15,2'} unused_credits:decimal{'15,2'} external_guid applied_to_txn_id data_ext_id


rails g scaffold ReceivePaymentToDeposit txn_type customer_id txn_date:date ref_number amount:decimal{'15,2'} currency_id exchange_rate:float amount_in_home_currency:decimal{'15,2'}


rails g scaffold RefundAppliedToTxn txn_type txn_date:date ref_number credit_remaining:decimal{'15,2'} refund_amount:decimal{'15,2'} credit_remaining_in_home_currency:decimal{'15,2'} refund_amount_in_home_currency:decimal{'15,2'}


rails g scaffold Report report_title report_subtitle report_basis num_rows:integer num_columns:integer num_col_title_rows:integer col_desc report_data


rails g scaffold SalesOrderLineGroup item_group_id desc quantity unit_of_measure override_uom_set_id is_print_items_in_group:boolean total_amount:decimal{'15,2'} sales_order_line_id data_ext_id


rails g scaffold SalesOrderLine item_id desc quantity unit_of_measure override_uom_set_id rate rate_percent:float class_id amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_id inventory_site_location_id serial_number lot_number sales_tax_code_id invoiced is_manually_closed:boolean other1 other2 data_ext_id


rails g scaffold SalesOrder time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_id class_id template_id txn_date:date ref_number bill_address_addr1 bill_address_addr2 bill_address_addr3 bill_address_addr4 bill_address_addr5 bill_address_city bill_address_state bill_address_postal_code bill_address_country bill_address_note ship_address_addr1 ship_address_addr2 ship_address_addr3 ship_address_addr4 ship_address_addr5 ship_address_city ship_address_state ship_address_postal_code ship_address_country ship_address_note po_number terms_id due_date:date sales_rep_id fob ship_date:date ship_method_id subtotal:decimal{'15,2'} item_sales_tax_id sales_tax_percentage:float sales_tax_total:decimal{'15,2'} total_amount:decimal{'15,2'} currency_id exchange_rate:float total_amount_in_home_currency:decimal{'15,2'} is_manually_closed:boolean is_fully_invoiced:boolean memo:text customer_msg_id is_to_be_printed:boolean is_to_be_emailed:boolean is_tax_included:boolean customer_sales_tax_code_id other external_guid linked_txn sales_order_line_id sales_order_line_group_id data_ext_id


rails g scaffold SalesReceiptLineGroup item_group_id desc quantity unit_of_measure override_uom_set_id is_print_items_in_group:boolean total_amount:decimal{'15,2'} service_date:date sales_receipt_line_id data_ext_id


rails g scaffold SalesReceiptLine item_id desc quantity unit_of_measure override_uom_set_id rate rate_percent:float class_id amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_id inventory_site_location_id serial_number lot_number service_date:date sales_tax_code_id is_taxable:boolean other1 other2 credit_card_txn_info data_ext_id


rails g scaffold SalesReceipt time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_id class_id template_id txn_date:date ref_number bill_address_addr1 bill_address_addr2 bill_address_addr3 bill_address_addr4 bill_address_addr5 bill_address_city bill_address_state bill_address_postal_code bill_address_country bill_address_note ship_address_addr1 ship_address_addr2 ship_address_addr3 ship_address_addr4 ship_address_addr5 ship_address_city ship_address_state ship_address_postal_code ship_address_country ship_address_note is_pending:boolean check_number payment_method_id due_date:date sales_rep_id ship_date:date ship_method_id fob subtotal:decimal{'15,2'} item_sales_tax_id sales_tax_percentage:float sales_tax_total:decimal{'15,2'} total_amount:decimal{'15,2'} currency_id exchange_rate:float total_amount_in_home_currency:decimal{'15,2'} memo:text customer_msg_id is_to_be_printed:boolean is_to_be_emailed:boolean is_tax_included:boolean customer_sales_tax_code_id deposit_to_account_id credit_card_txn_info other external_guid sales_receipt_line_id sales_receipt_line_group_id discount_line_id sales_tax_line_id shipping_line_id data_ext_id


rails g scaffold SalesRep time_created:datetime time_modified:datetime edit_sequence initial is_active:boolean sales_rep_entity_id


rails g scaffold SalesTaxCode time_created:datetime time_modified:datetime edit_sequence name is_active:boolean is_taxable:boolean desc item_purchase_tax_id item_sales_tax_id


rails g scaffold SalesTaxLine amount:decimal{'15,2'} rate_percent:float account_id


rails g scaffold SalesTaxPayableLine item_sales_tax_id amount:decimal{'15,2'}


rails g scaffold SalesTaxPayable payee_entity_id amount:decimal{'15,2'} sales_tax_payable_line_id


rails g scaffold SalesTaxPaymentCheckLine item_sales_tax_id amount:decimal{'15,2'} tax_amount:decimal{'15,2'}


rails g scaffold SalesTaxPaymentCheck time_created:datetime time_modified:datetime edit_sequence txn_number:integer payee_entity_id txn_date:date bank_account_id amount:decimal{'15,2'} ref_number memo:text address is_to_be_printed:boolean external_guid sales_tax_payment_check_line_id data_ext_id


rails g scaffold SalesTaxReturnLine full_name line_type


rails g scaffold SalesTaxReturn full_name desc


rails g scaffold ShipMethod time_created:datetime time_modified:datetime edit_sequence name is_active:boolean


rails g scaffold ShippingLine amount:decimal{'15,2'} account_id


rails g scaffold StandardTerm time_created:datetime time_modified:datetime edit_sequence name is_active:boolean std_due_days:integer std_discount_days:integer discount_pct:float


rails g scaffold TaxLineInfo tax_line_id:integer tax_line_name


rails g scaffold Template time_created:datetime time_modified:datetime edit_sequence name is_active:boolean template_type


rails g scaffold TimeTracking time_created:datetime time_modified:datetime edit_sequence txn_number:integer txn_date:date entity_id customer_id item_service_id rate duration class_id payroll_item_wage_id notes:text billable_status external_guid


rails g scaffold ToDo time_created:datetime time_modified:datetime edit_sequence notes:text is_active:boolean type priority customer_id employee_id lead_id vendor_id is_done:boolean reminder_date:date reminder_time


rails g scaffold Transaction txn_type time_created:datetime time_modified:datetime entity_id account_id txn_date:date ref_number amount:decimal{'15,2'} currency_id exchange_rate:float amount_in_home_currency:decimal{'15,2'} memo:text


rails g scaffold TransferInventoryLine item_id from_inventory_site_location_id to_inventory_site_location_id quantity_transferred serial_number lot_number


rails g scaffold TransferInventory time_created:datetime time_modified:datetime edit_sequence txn_number:integer txn_date:date ref_number from_inventory_site_id to_inventory_site_id memo:text external_guid transfer_inventory_line_id


rails g scaffold Transfer time_created:datetime time_modified:datetime edit_sequence txn_number:integer txn_date:date transfer_from_account_id from_account_balance:decimal{'15,2'} transfer_to_account_id to_account_balance:decimal{'15,2'} class_id amount:decimal{'15,2'} memo:text


rails g scaffold TxnDeleted txn_del_type time_created:datetime time_deleted:datetime ref_number


rails g scaffold UIEventSubscription subscriber_id time_created:datetime time_last_processed:datetime com_callback_info delivery_policy company_file_event_subscription


rails g scaffold UIExtensionSubscription subscriber_id time_created:datetime time_last_processed:datetime com_callback_info menu_extension_subscription


rails g scaffold UnitOfMeasureSet time_created:datetime time_modified:datetime edit_sequence name is_active:boolean unit_of_measure_type base_unit related_unit default_unit


rails g scaffold VehicleMileage time_created:datetime time_modified:datetime edit_sequence vehicle_id customer_id item_id class_id trip_start_date:date trip_end_date:date odometer_start odometer_end total_miles notes:text billable_status standard_mileage_rate:float standard_mileage_total_amount:decimal{'15,2'} billable_rate billable_amount:decimal{'15,2'}


rails g scaffold Vehicle time_created:datetime time_modified:datetime edit_sequence name is_active:boolean desc


rails g scaffold VendorCredit time_created:datetime time_modified:datetime edit_sequence txn_number:integer vendor_id ap_account_id txn_date:date credit_amount:decimal{'15,2'} currency_id exchange_rate:float credit_amount_in_home_currency:decimal{'15,2'} ref_number memo:text is_tax_included:boolean sales_tax_code_id external_guid linked_txn expense_line_id item_line_id item_group_line_id open_amount:decimal{'15,2'} data_ext_id


rails g scaffold Vendor time_created:datetime time_modified:datetime edit_sequence name is_active:boolean class_id is_tax_agency:boolean company_name salutation first_name middle_name last_name suffix job_title vendor_address ship_address_addr1 ship_address_addr2 ship_address_addr3 ship_address_addr4 ship_address_addr5 ship_address_city ship_address_state ship_address_postal_code ship_address_country ship_address_note phone mobile pager alt_phone fax email cc contact alt_contact additional_contact_id contacts_id name_on_check account_number notes:text additional_notes_id vendor_type_id terms_id credit_limit:decimal{'15,2'} vendor_tax_ident is_vendor_eligible_for1099:boolean balance:decimal{'15,2'} billing_rate_id external_guid sales_tax_code_id sales_tax_country is_sales_tax_agency:boolean sales_tax_return_id tax_registration_number reporting_period is_tax_tracked_on_purchases:boolean tax_on_purchases_account_id is_tax_tracked_on_sales:boolean tax_on_sales_account_id is_tax_on_tax:boolean prefill_account_id currency_id data_ext_id


rails g scaffold VendorType time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean parent_id sublevel:integer


rails g scaffold WorkersCompCode time_created:datetime time_modified:datetime edit_sequence name is_active:boolean desc current_rate current_effective_date:date next_rate next_effective_date:date rate_history
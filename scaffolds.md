rails g scaffold ARRefundCreditCard txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_ref refund_from_account_ref ar_account_ref txn_date:date ref_number total_amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} total_amount_in_home_currency:decimal{'15,2'} address address_block payment_method_ref memo credit_card_txn_info external_guid refund_applied_to_txn_ret data_ext_ret


rails g scaffold Account list_id time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean parent_ref sublevel:integer account_type detail_account_type special_account_type is_tax_account:boolean account_number bank_number last_check_number desc balance:decimal{'15,2'} total_balance:decimal{'15,2'} sales_tax_code_ref tax_line_info_ret cash_flow_classification currency_ref data_ext_ret


rails g scaffold AccountTaxLineInfo tax_line_id:integer tax_line_name


* rails g model AdditionalNote note_id:integer date:date note


rails g scaffold AppliedToTxn txn_id txn_type txn_date:date ref_number balance_remaining:decimal{'15,2'} amount:decimal{'15,2'} txn_line_detail discount_amount:decimal{'15,2'} discount_account_ref discount_class_ref linked_txn


rails g scaffold BarCode list_type list_id full_name


rails g scaffold BillPaymentCheck txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer payee_entity_ref ap_account_ref txn_date:date bank_account_ref amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} amount_in_home_currency:decimal{'15,2'} ref_number memo address address_block is_to_be_printed:boolean external_guid applied_to_txn_ret data_ext_ret


rails g scaffold BillPaymentCreditCard txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer payee_entity_ref ap_account_ref txn_date:date credit_card_account_ref amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} amount_in_home_currency:decimal{'15,2'} ref_number memo external_guid applied_to_txn_ret data_ext_ret


rails g scaffold Bill txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer vendor_ref vendor_address ap_account_ref txn_date:date due_date:date amount_due:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} amount_due_in_home_currency:decimal{'15,2'} ref_number terms_ref memo is_tax_included:boolean sales_tax_code_ref is_paid:boolean external_guid linked_txn expense_line_ret item_line_ret item_group_line_ret open_amount:decimal{'15,2'} data_ext_ret


rails g scaffold BillToPay bill_to_pay credit_to_apply


rails g scaffold BillingRatePerItem item_ref custom_rate custom_rate_percent:float{'10,2'}


rails g scaffold BillingRate list_id time_created:datetime time_modified:datetime edit_sequence name billing_rate_type fixed_billing_rate billing_rate_per_item_ret


rails g scaffold BuildAssembly txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer item_inventory_assembly_ref inventory_site_ref inventory_site_location_ref serial_number lot_number txn_date:date ref_number memo is_pending:boolean quantity_to_build quantity_can_build quantity_on_hand quantity_on_sales_order external_guid component_item_line_ret data_ext_ret


rails g scaffold CashBackInfo txn_line_id account_ref memo amount:decimal{'15,2'}


rails g scaffold Charge txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_ref txn_date:date ref_number item_ref inventory_site_ref inventory_site_location_ref quantity unit_of_measure override_uom_set_ref rate amount:decimal{'15,2'} balance_remaining:decimal{'15,2'} desc ar_account_ref class_ref billed_date:date due_date:date is_paid:boolean external_guid linked_txn data_ext_ret


rails g scaffold Check txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer account_ref payee_entity_ref ref_number txn_date:date amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} amount_in_home_currency:decimal{'15,2'} memo address address_block is_to_be_printed:boolean is_tax_included:boolean sales_tax_code_ref external_guid linked_txn expense_line_ret item_line_ret item_group_line_ret data_ext_ret


* rails g model Class list_id time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean parent_ref sublevel:integer


rails g scaffold CompanyActivity last_restore_time:datetime last_condense_time:datetime


rails g scaffold Company is_sample_company:boolean company_name legal_company_name address address_block legal_address company_address_for_customer company_address_block_for_customer phone fax email company_email_for_customer company_web_site first_month_fiscal_year first_month_income_tax_year company_type ein ssn tax_form subscribed_services accountant_copy data_ext_ret


rails g scaffold ComponentItemLine item_ref inventory_site_ref inventory_site_location_ref serial_number lot_number desc quantity_on_hand quantity_needed


* rails g model Contact list_id time_created:datetime time_modified:datetime edit_sequence contact salutation first_name middle_name last_name job_title additional_contact_ref


rails g scaffold CreditCardCharge txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer account_ref payee_entity_ref txn_date:date amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} amount_in_home_currency:decimal{'15,2'} ref_number memo is_tax_included:boolean sales_tax_code_ref external_guid expense_line_ret item_line_ret item_group_line_ret data_ext_ret


rails g scaffold CreditCardCredit txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer account_ref payee_entity_ref txn_date:date amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} amount_in_home_currency:decimal{'15,2'} ref_number memo is_tax_included:boolean sales_tax_code_ref external_guid expense_line_ret item_line_ret item_group_line_ret data_ext_ret


rails g scaffold CreditMemoLineGroup txn_line_id item_group_ref desc quantity unit_of_measure override_uom_set_ref is_print_items_in_group:boolean total_amount:decimal{'15,2'} service_date:date credit_memo_line_ret data_ext_ret


rails g scaffold CreditMemoLine txn_line_id item_ref desc quantity unit_of_measure override_uom_set_ref rate rate_percent:float{'10,2'} class_ref amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_ref inventory_site_location_ref serial_number lot_number service_date:date sales_tax_code_ref is_taxable:boolean other1 other2 credit_card_txn_info data_ext_ret


rails g scaffold CreditMemo txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_ref class_ref ar_account_ref template_ref txn_date:date ref_number bill_address bill_address_block ship_address ship_address_block is_pending:boolean po_number terms_ref due_date:date sales_rep_ref fob ship_date:date ship_method_ref subtotal:decimal{'15,2'} item_sales_tax_ref sales_tax_percentage:float{'10,2'} sales_tax_total:decimal{'15,2'} total_amount:decimal{'15,2'} credit_remaining:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} credit_remaining_in_home_currency:decimal{'15,2'} memo customer_msg_ref is_to_be_printed:boolean is_to_be_emailed:boolean is_tax_included:boolean customer_sales_tax_code_ref other external_guid linked_txn credit_memo_line_ret credit_memo_line_group_ret discount_line_ret sales_tax_line_ret shipping_line_ret data_ext_ret


* rails g model Currency list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean currency_code currency_format is_user_defined_currency:boolean exchange_rate:float{'10,2'} as_of_date:date


rails g scaffold CustomerMsg list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean


rails g scaffold Customer list_id time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean class_ref parent_ref sublevel:integer company_name salutation first_name middle_name last_name suffix job_title bill_address bill_address_block ship_address ship_address_block ship_to_address print_as phone mobile pager alt_phone fax email cc contact alt_contact additional_contact_ref contacts_ret customer_type_ref terms_ref sales_rep_ref balance:decimal{'15,2'} total_balance:decimal{'15,2'} sales_tax_code_ref item_sales_tax_ref sales_tax_country resale_number account_number credit_limit:decimal{'15,2'} preferred_payment_method_ref credit_card_info job_status job_start_date:date job_projected_end_date:date job_end_date:date job_desc job_type_ref notes additional_notes_ret is_statement_with_parent:boolean delivery_method preferred_delivery_method price_level_ref external_guid tax_registration_number currency_ref data_ext_ret


* rails g model CustomerType list_id time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean parent_ref sublevel:integer


rails g scaffold DataEventRecoveryInfo subscriber_id data_event_recovery_time:datetime


rails g scaffold DataEventSubscription subscriber_id time_created:datetime time_last_processed:datetime com_callback_info delivery_policy track_lost_events deliver_own_events:boolean list_event_subscription txn_event_subscription


rails g scaffold DataExtDefDel owner_id data_ext_name time_deleted:datetime


rails g scaffold DataExtDef owner_id data_ext_id:integer data_ext_name data_ext_type assign_to_object data_ext_list_require:boolean data_ext_txn_require:boolean data_ext_format_string


rails g scaffold DataExtDel owner_id data_ext_name list_data_ext_type list_obj_ref txn_data_ext_type txn_id txn_line_id other_data_ext_type time_deleted:datetime


* rails g model DataExt owner_id data_ext_name data_ext_type data_ext_value


rails g scaffold DateDrivenTerm list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean day_of_month_due:integer due_next_month_days:integer discount_day_of_month:integer discount_pct:float{'10,2'}


rails g scaffold DepositLine txn_type txn_id txn_line_id payment_txn_line_id entity_ref account_ref memo check_number payment_method_ref class_ref amount:decimal{'15,2'}


rails g scaffold Deposit txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer txn_date:date deposit_to_account_ref memo deposit_total:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} deposit_total_in_home_currency:decimal{'15,2'} cash_back_info_ret external_guid deposit_line_ret data_ext_ret


rails g scaffold DiscountLine amount:decimal{'15,2'} rate_percent:float{'10,2'} is_taxable:boolean account_ref


rails g scaffold Employee list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean salutation first_name middle_name last_name suffix job_title supervisor_ref department description target_bonus:decimal{'15,2'} employee_address print_as phone mobile pager pager_pin alt_phone fax ssn email additional_contact_ref emergency_contacts employee_type part_or_full_time exempt key_employee gender hired_date:date original_hire_date:date adjusted_service_date:date released_date:date birth_date:date us_citizen ethnicity disabled disability_desc on_file work_auth_expire_date:date us_veteran military_status account_number notes additional_notes_ret billing_rate_ref employee_payroll_info external_guid data_ext_ret


rails g scaffold EstimateLineGroup txn_line_id item_group_ref desc quantity unit_of_measure override_uom_set_ref is_print_items_in_group:boolean total_amount:decimal{'15,2'} estimate_line_ret data_ext_ret


rails g scaffold EstimateLine txn_line_id item_ref desc quantity unit_of_measure override_uom_set_ref rate rate_percent:float{'10,2'} class_ref amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_ref inventory_site_location_ref sales_tax_code_ref markup_rate markup_rate_percent:float{'10,2'} other1 other2 data_ext_ret


rails g scaffold Estimate txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_ref class_ref template_ref txn_date:date ref_number bill_address bill_address_block ship_address ship_address_block is_active:boolean po_number terms_ref due_date:date sales_rep_ref fob subtotal:decimal{'15,2'} item_sales_tax_ref sales_tax_percentage:float{'10,2'} sales_tax_total:decimal{'15,2'} total_amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} total_amount_in_home_currency:decimal{'15,2'} memo customer_msg_ref is_to_be_emailed:boolean is_tax_included:boolean customer_sales_tax_code_ref other external_guid linked_txn estimate_line_ret estimate_line_group_ret data_ext_ret


rails g scaffold ExpenseLine txn_line_id account_ref amount:decimal{'15,2'} tax_amount:decimal{'15,2'} memo customer_ref class_ref sales_tax_code_ref billable_status sales_rep_ref data_ext_ret


rails g scaffold Form1099CategoryAccountMapping is_filing1099_misc:boolean category_account_mapping


rails g scaffold Host product_name major_version minor_version country supported_qbxml_version is_automatic_login:boolean qb_file_mode list_meta_data


rails g scaffold InventoryAdjustmentLine txn_line_id item_ref serial_number serial_number_added_or_removed lot_number inventory_site_location_ref quantity_difference value_difference:decimal{'15,2'}


rails g scaffold InventoryAdjustment txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer account_ref inventory_site_ref txn_date:date ref_number customer_ref class_ref memo external_guid inventory_adjustment_line_ret data_ext_ret


rails g scaffold InventorySite list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean parent_site_ref is_default_site:boolean site_desc contact phone fax email site_address site_address_block


rails g scaffold InvoiceLineGroup txn_line_id item_group_ref desc quantity unit_of_measure override_uom_set_ref is_print_items_in_group:boolean total_amount:decimal{'15,2'} service_date:date invoice_line_ret data_ext_ret


rails g scaffold InvoiceLine txn_line_id item_ref desc quantity unit_of_measure override_uom_set_ref rate rate_percent:float{'10,2'} class_ref amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_ref inventory_site_location_ref serial_number lot_number service_date:date sales_tax_code_ref is_taxable:boolean other1 other2 data_ext_ret


rails g scaffold Invoice txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_ref class_ref ar_account_ref template_ref txn_date:date ref_number bill_address bill_address_block ship_address ship_address_block is_pending:boolean is_finance_charge:boolean po_number terms_ref due_date:date sales_rep_ref fob ship_date:date ship_method_ref subtotal:decimal{'15,2'} item_sales_tax_ref sales_tax_percentage:float{'10,2'} sales_tax_total:decimal{'15,2'} applied_amount:decimal{'15,2'} balance_remaining:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} balance_remaining_in_home_currency:decimal{'15,2'} memo is_paid:boolean customer_msg_ref is_to_be_printed:boolean is_to_be_emailed:boolean is_tax_included:boolean customer_sales_tax_code_ref suggested_discount_amount:decimal{'15,2'} suggested_discount_date:date other external_guid linked_txn invoice_line_ret invoice_line_group_ret discount_line_ret sales_tax_line_ret shipping_line_ret data_ext_ret


rails g scaffold ItemAssembliesCanBuild item_inventory_assembly_ref txn_date:date quantity_can_build


rails g scaffold ItemDiscount list_id time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_ref parent_ref sublevel:integer item_desc sales_tax_code_ref discount_rate discount_rate_percent:float{'10,2'} account_ref external_guid data_ext_ret


rails g scaffold ItemFixedAsset list_id time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean class_ref acquired_as purchase_desc purchase_date:date purchase_cost vendor_or_payee_name asset_account_ref fixed_asset_sales_info asset_desc location po_number serial_number warranty_exp_date:date notes asset_number cost_basis:decimal{'15,2'} year_end_accumulated_depreciation:decimal{'15,2'} year_end_book_value:decimal{'15,2'} external_guid data_ext_ret


rails g scaffold ItemGroupLine txn_line_id item_group_ref desc quantity unit_of_measure override_uom_set_ref total_amount:decimal{'15,2'} item_line_ret data_ext


rails g scaffold ItemGroup list_id time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean item_desc unit_of_measure_set_ref is_print_items_in_group:boolean special_item_type external_guid item_group_line data_ext_ret


rails g scaffold ItemInventoryAssembly list_id time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_ref parent_ref sublevel:integer manufacturer_part_number unit_of_measure_set_ref is_tax_included:boolean sales_tax_code_ref sales_desc sales_price income_account_ref purchase_desc purchase_cost purchase_tax_code_ref cogs_account_ref pref_vendor_ref asset_account_ref build_point max quantity_on_hand average_cost quantity_on_order quantity_on_sales_order external_guid item_inventory_assembly_line data_ext_ret


rails g scaffold ItemInventory list_id time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_ref parent_ref sublevel:integer manufacturer_part_number unit_of_measure_set_ref is_tax_included:boolean sales_tax_code_ref sales_desc sales_price income_account_ref purchase_desc purchase_cost purchase_tax_code_ref cogs_account_ref pref_vendor_ref asset_account_ref reorder_point max quantity_on_hand average_cost quantity_on_order quantity_on_sales_order external_guid data_ext_ret


rails g scaffold ItemLine txn_line_id item_ref inventory_site_ref inventory_site_location_ref serial_number lot_number desc quantity unit_of_measure override_uom_set_ref cost amount:decimal{'15,2'} tax_amount:decimal{'15,2'} customer_ref class_ref sales_tax_code_ref billable_status sales_rep_ref data_ext_ret


rails g scaffold ItemNonInventory list_id time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_ref parent_ref sublevel:integer manufacturer_part_number unit_of_measure_set_ref is_tax_included:boolean sales_tax_code_ref sales_or_purchase sales_and_purchase external_guid data_ext_ret


rails g scaffold ItemOtherCharge list_id time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_ref parent_ref sublevel:integer is_tax_included:boolean sales_tax_code_ref sales_or_purchase sales_and_purchase special_item_type external_guid data_ext_ret


rails g scaffold ItemPayment list_id time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean class_ref item_desc deposit_to_account_ref payment_method_ref external_guid data_ext_ret


rails g scaffold ItemReceipt txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer vendor_ref ap_account_ref liability_account_ref txn_date:date total_amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} total_amount_in_home_currency:decimal{'15,2'} ref_number memo is_tax_included:boolean sales_tax_code_ref external_guid linked_txn expense_line_ret item_line_ret item_group_line_ret data_ext_ret


rails g scaffold ItemSalesTaxGroup list_id time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean item_desc external_guid item_sales_tax_ref data_ext_ret


* rails g model ItemSalesTax list_id time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean class_ref item_desc tax_rate:float{'10,2'} tax_vendor_ref sales_tax_return_line_ref external_guid data_ext_ret


rails g scaffold ItemService list_id time_created:datetime time_modified:datetime edit_sequence name full_name bar_code_value is_active:boolean class_ref parent_ref sublevel:integer unit_of_measure_set_ref is_tax_included:boolean sales_tax_code_ref sales_or_purchase sales_and_purchase external_guid data_ext_ret


rails g scaffold ItemSite list_id time_created:datetime time_modified:datetime edit_sequence item_inventory_assembly_ref item_inventory_ref inventory_site_ref inventory_site_location_ref reorder_level quantity_on_hand quantity_on_purchase_orders quantity_on_sales_orders quantity_to_be_built_by_pending_build_txns quantity_required_by_pending_build_txns quantity_on_pending_transfers assembly_build_point


rails g scaffold ItemSubtotal list_id time_created:datetime time_modified:datetime edit_sequence name bar_code_value is_active:boolean item_desc special_item_type external_guid data_ext_ret


* rails g model JobType list_id time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean parent_ref sublevel:integer


rails g scaffold JournalEntry txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer txn_date:date ref_number memo is_adjustment:boolean is_home_currency_adjustment:boolean is_amounts_entered_in_home_currency:boolean currency_ref exchange_rate:float{'10,2'} external_guid journal_debit_line journal_credit_line data_ext_ret


rails g scaffold LeadContact lead_contact_id:integer salutation first_name middle_name last_name job_title additional_contact_ref is_primary_contact:boolean


rails g scaffold Lead list_id time_created:datetime time_modified:datetime edit_sequence full_name status company_name main_phone additional_contact_ref locations_ret lead_contacts_ret


rails g scaffold ListDeleted list_del_type list_id time_created:datetime time_deleted:datetime full_name


rails g scaffold Location location_id:integer main_address location lead_address


rails g scaffold OtherName list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean company_name salutation first_name middle_name last_name other_name_address other_name_address_block phone alt_phone fax email contact alt_contact account_number notes external_guid data_ext_ret


rails g scaffold PaymentMethod list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean payment_method_type


rails g scaffold PayrollItemNonWage list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean non_wage_type expense_account_ref liability_account_ref


rails g scaffold PayrollItemWage list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean wage_type expense_account_ref


rails g scaffold PayrollLastPeriod period_start_date:date period_end_date:date


rails g scaffold Preference accounting_preferences finance_charge_preferences jobs_and_estimates_preferences multi_currency_preferences multi_location_inventory_preferences purchases_and_vendors_preferences reports_preferences sales_and_customers_preferences sales_tax_preferences time_tracking_preferences current_app_access_rights items_and_inventory_preferences


rails g scaffold PriceLevelPerItem item_ref custom_price custom_price_percent:float{'10,2'}


* rails g model PriceLevel list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean price_level_type price_level_fixed_percentage:float{'10,2'} price_level_per_item_ret currency_ref


rails g scaffold PurchaseOrderLineGroup txn_line_id item_group_ref desc quantity unit_of_measure override_uom_set_ref is_print_items_in_group:boolean total_amount:decimal{'15,2'} service_date:date purchase_order_line_ret data_ext_ret


rails g scaffold PurchaseOrderLine txn_line_id item_ref manufacturer_part_number desc quantity unit_of_measure override_uom_set_ref rate class_ref amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_location_ref customer_ref service_date:date sales_tax_code_ref received_quantity unbilled_quantity is_billed:boolean is_manually_closed:boolean other1 other2 data_ext_ret


rails g scaffold PurchaseOrder txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer vendor_ref class_ref inventory_site_ref ship_to_entity_ref template_ref txn_date:date ref_number vendor_address vendor_address_block ship_address ship_address_block terms_ref due_date:date expected_date:date ship_method_ref fob total_amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} total_amount_in_home_currency:decimal{'15,2'} is_manually_closed:boolean is_fully_received:boolean memo vendor_msg is_to_be_printed:boolean is_to_be_emailed:boolean is_tax_included:boolean sales_tax_code_ref other1 other2 external_guid linked_txn purchase_order_line_ret purchase_order_line_group_ret data_ext_ret


rails g scaffold ReceivePayment txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_ref ar_account_ref txn_date:date ref_number total_amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} total_amount_in_home_currency:decimal{'15,2'} payment_method_ref memo deposit_to_account_ref credit_card_txn_info unused_payment:decimal{'15,2'} unused_credits:decimal{'15,2'} external_guid applied_to_txn_ret data_ext_ret


rails g scaffold ReceivePaymentToDeposit txn_id txn_line_id txn_type customer_ref txn_date:date ref_number amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} amount_in_home_currency:decimal{'15,2'}


rails g scaffold RefundAppliedToTxn txn_id txn_type txn_date:date ref_number credit_remaining:decimal{'15,2'} refund_amount:decimal{'15,2'} credit_remaining_in_home_currency:decimal{'15,2'} refund_amount_in_home_currency:decimal{'15,2'}


rails g scaffold Report report_title report_subtitle report_basis num_rows:integer num_columns:integer num_col_title_rows:integer col_desc report_data


rails g scaffold SalesOrderLineGroup txn_line_id item_group_ref desc quantity unit_of_measure override_uom_set_ref is_print_items_in_group:boolean total_amount:decimal{'15,2'} sales_order_line_ret data_ext_ret


rails g scaffold SalesOrderLine txn_line_id item_ref desc quantity unit_of_measure override_uom_set_ref rate rate_percent:float{'10,2'} class_ref amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_ref inventory_site_location_ref serial_number lot_number sales_tax_code_ref invoiced is_manually_closed:boolean other1 other2 data_ext_ret


rails g scaffold SalesOrder txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_ref class_ref template_ref txn_date:date ref_number bill_address bill_address_block ship_address ship_address_block po_number terms_ref due_date:date sales_rep_ref fob ship_date:date ship_method_ref subtotal:decimal{'15,2'} item_sales_tax_ref sales_tax_percentage:float{'10,2'} sales_tax_total:decimal{'15,2'} total_amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} total_amount_in_home_currency:decimal{'15,2'} is_manually_closed:boolean is_fully_invoiced:boolean memo customer_msg_ref is_to_be_printed:boolean is_to_be_emailed:boolean is_tax_included:boolean customer_sales_tax_code_ref other external_guid linked_txn sales_order_line_ret sales_order_line_group_ret data_ext_ret


rails g scaffold SalesReceiptLineGroup txn_line_id item_group_ref desc quantity unit_of_measure override_uom_set_ref is_print_items_in_group:boolean total_amount:decimal{'15,2'} service_date:date sales_receipt_line_ret data_ext_ret


rails g scaffold SalesReceiptLine txn_line_id item_ref desc quantity unit_of_measure override_uom_set_ref rate rate_percent:float{'10,2'} class_ref amount:decimal{'15,2'} tax_amount:decimal{'15,2'} inventory_site_ref inventory_site_location_ref serial_number lot_number service_date:date sales_tax_code_ref is_taxable:boolean other1 other2 credit_card_txn_info data_ext_ret


rails g scaffold SalesReceipt txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer customer_ref class_ref template_ref txn_date:date ref_number bill_address bill_address_block ship_address ship_address_block is_pending:boolean check_number payment_method_ref due_date:date sales_rep_ref ship_date:date ship_method_ref fob subtotal:decimal{'15,2'} item_sales_tax_ref sales_tax_percentage:float{'10,2'} sales_tax_total:decimal{'15,2'} total_amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} total_amount_in_home_currency:decimal{'15,2'} memo customer_msg_ref is_to_be_printed:boolean is_to_be_emailed:boolean is_tax_included:boolean customer_sales_tax_code_ref deposit_to_account_ref credit_card_txn_info other external_guid sales_receipt_line_ret sales_receipt_line_group_ret discount_line_ret sales_tax_line_ret shipping_line_ret data_ext_ret


* rails g model SalesRep list_id time_created:datetime time_modified:datetime edit_sequence initial is_active:boolean sales_rep_entity_ref


* rails g model SalesTaxCode list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean is_taxable:boolean desc item_purchase_tax_ref item_sales_tax_ref


rails g scaffold SalesTaxLine amount:decimal{'15,2'} rate_percent:float{'10,2'} account_ref


rails g scaffold SalesTaxPayableLine item_sales_tax_ref amount:decimal{'15,2'}


rails g scaffold SalesTaxPayable payee_entity_ref amount:decimal{'15,2'} sales_tax_payable_line_ret


rails g scaffold SalesTaxPaymentCheckLine txn_line_id item_sales_tax_ref amount:decimal{'15,2'} tax_amount:decimal{'15,2'}


rails g scaffold SalesTaxPaymentCheck txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer payee_entity_ref txn_date:date bank_account_ref amount:decimal{'15,2'} ref_number memo address address_block is_to_be_printed:boolean external_guid sales_tax_payment_check_line_ret data_ext_ret


rails g scaffold SalesTaxReturnLine list_id full_name line_type


rails g scaffold SalesTaxReturn list_id full_name desc


rails g scaffold ShipMethod list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean


rails g scaffold ShippingLine amount:decimal{'15,2'} account_ref


rails g scaffold StandardTerm list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean std_due_days:integer std_discount_days:integer discount_pct:float{'10,2'}


rails g scaffold TaxLineInfo tax_line_id:integer tax_line_name


rails g scaffold Template list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean template_type


rails g scaffold TimeTracking txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer txn_date:date entity_ref customer_ref item_service_ref rate duration class_ref payroll_item_wage_ref notes billable_status external_guid


rails g scaffold ToDo list_id time_created:datetime time_modified:datetime edit_sequence notes is_active:boolean type priority customer_ref employee_ref lead_ref vendor_ref is_done:boolean reminder_date:date reminder_time


rails g scaffold Transaction txn_type txn_id txn_line_id time_created:datetime time_modified:datetime entity_ref account_ref txn_date:date ref_number amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} amount_in_home_currency:decimal{'15,2'} memo


rails g scaffold TransferInventoryLine txn_line_id item_ref from_inventory_site_location_ref to_inventory_site_location_ref quantity_transferred serial_number lot_number


rails g scaffold TransferInventory txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer txn_date:date ref_number from_inventory_site_ref to_inventory_site_ref memo external_guid transfer_inventory_line_ret


rails g scaffold Transfer txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer txn_date:date transfer_from_account_ref from_account_balance:decimal{'15,2'} transfer_to_account_ref to_account_balance:decimal{'15,2'} class_ref amount:decimal{'15,2'} memo


rails g scaffold TxnDeleted txn_del_type txn_id time_created:datetime time_deleted:datetime ref_number


rails g scaffold UIEventSubscription subscriber_id time_created:datetime time_last_processed:datetime com_callback_info delivery_policy company_file_event_subscription


rails g scaffold UIExtensionSubscription subscriber_id time_created:datetime time_last_processed:datetime com_callback_info menu_extension_subscription


rails g scaffold UnitOfMeasureSet list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean unit_of_measure_type base_unit related_unit default_unit


rails g scaffold VehicleMileage txn_id time_created:datetime time_modified:datetime edit_sequence vehicle_ref customer_ref item_ref class_ref trip_start_date:date trip_end_date:date odometer_start odometer_end total_miles notes billable_status standard_mileage_rate:float{'10,2'} standard_mileage_total_amount:decimal{'15,2'} billable_rate billable_amount:decimal{'15,2'}


rails g scaffold Vehicle list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean desc


rails g scaffold VendorCredit txn_id time_created:datetime time_modified:datetime edit_sequence txn_number:integer vendor_ref ap_account_ref txn_date:date credit_amount:decimal{'15,2'} currency_ref exchange_rate:float{'10,2'} credit_amount_in_home_currency:decimal{'15,2'} ref_number memo is_tax_included:boolean sales_tax_code_ref external_guid linked_txn expense_line_ret item_line_ret item_group_line_ret open_amount:decimal{'15,2'} data_ext_ret


rails g scaffold Vendor list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean class_ref is_tax_agency:boolean company_name salutation first_name middle_name last_name suffix job_title vendor_address vendor_address_block ship_address phone mobile pager alt_phone fax email cc contact alt_contact additional_contact_ref contacts_ret name_on_check account_number notes additional_notes_ret vendor_type_ref terms_ref credit_limit:decimal{'15,2'} vendor_tax_ident is_vendor_eligible_for1099:boolean balance:decimal{'15,2'} billing_rate_ref external_guid sales_tax_code_ref sales_tax_country is_sales_tax_agency:boolean sales_tax_return_ref tax_registration_number reporting_period is_tax_tracked_on_purchases:boolean tax_on_purchases_account_ref is_tax_tracked_on_sales:boolean tax_on_sales_account_ref is_tax_on_tax:boolean prefill_account_ref currency_ref data_ext_ret


rails g scaffold VendorType list_id time_created:datetime time_modified:datetime edit_sequence name full_name is_active:boolean parent_ref sublevel:integer


rails g scaffold WorkersCompCode list_id time_created:datetime time_modified:datetime edit_sequence name is_active:boolean desc current_rate current_effective_date:date next_rate next_effective_date:date rate_history

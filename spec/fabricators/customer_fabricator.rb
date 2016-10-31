Fabricator(:customer) do
  # id                                       1
  id                                  {Faker::Code.isbn.insert(3, "-")}
  time_created                            {Faker::Date.between(18.months.ago, 3.days.ago)}
  time_modified                            {Faker::Date.between(2.days.ago, Date.today)}
  edit_sequence                          {Faker::Code.isbn}
  name                                      {Faker::Company.name}
  full_name                                {Faker::Name.name}
  is_active                                 {Faker::Boolean.boolean(0.8)}
  class_id				                       {Faker::Code.isbn}
  parent_id				                       {Faker::Code.isbn}
  sublevel                                 {Faker::Number.between(0,4)}
  company_name                            {Faker::Company.name}
  salutation                                {Faker::Name.prefix}
  first_name                               {Faker::Name.first_name}
  middle_name                               {Faker::Name.first_name}
  last_name                                {Faker::Name.last_name}
  # job_title                                "MyString"
  bill_address_addr1                       {Faker::Address.street_address}
  bill_address_addr2                       {Faker::Address.secondary_address}
  bill_address_addr3                      {Faker::Address.city}
  bill_address_addr4                      {Faker::Address.state}
  bill_address_addr5                     {Faker::Address.postcode}
  bill_address_city                        {Faker::Address.city}
  bill_address_state                       {Faker::Address.state_abbr}
  bill_address_postal_code                 {Faker::Address.postcode}
  # bill_address_country                     "MyString"
  # bill_address_note                        "MyString"
  bill_address_block_addr1                {Faker::Address.street_address}
  bill_address_block_addr2               {Faker::Address.secondary_address}
  bill_address_block_addr3                {Faker::Address.city}
  bill_address_block_addr4                  {Faker::Address.state_abbr}
  bill_address_block_addr5                 {Faker::Address.postcode}
  ship_address_addr1                      {Faker::Address.street_address}
  ship_address_addr2                       {Faker::Address.secondary_address}
  ship_address_addr3                      {Faker::Address.city}
  ship_address_addr4                       {Faker::Address.state_abbr}
  ship_address_addr5                   {Faker::Address.postcode}
  ship_address_block_addr1                {Faker::Address.street_address}
  ship_address_block_addr2                {Faker::Address.secondary_address}
  ship_address_block_addr3                {Faker::Address.city}
  ship_address_block_addr4               {Faker::Address.state_abbr}
  ship_address_block_addr5                 {Faker::Address.postcode}
  ship_address_city                       {Faker::Address.city}
  ship_address_state                        {Faker::Address.state_abbr}
  ship_address_postal_code                  {Faker::Address.postcode}
  # ship_address_country                     "MyString"
  # ship_address_note                        "MyString"
  ship_to_address_name                   {Faker::Company.name}
  ship_to_address_addr1                 {Faker::Address.street_address}
  ship_to_address_addr2               {Faker::Address.secondary_address}
  ship_to_address_addr3                    {Faker::Address.city}
  ship_to_address_addr4                 {Faker::Address.state_abbr}
  ship_to_address_addr5                      {Faker::Address.postcode}
  ship_to_address_city                     {Faker::Address.city}
  ship_to_address_state                    {Faker::Address.state_abbr}
  ship_to_address_postal_code            {Faker::Address.postcode}
  # ship_to_address_country                  "MyString"
  # ship_to_address_note                     "MyString"
  ship_to_address_default_ship_to          true
  phone                                   {Faker::PhoneNumber.phone_number}
  alt_phone                               {Faker::PhoneNumber.phone_number}
  # fax                                      "MyString"
  # email                                    "MyString"
  # cc                                       "MyString"
  # contact                                  "MyString"
  # alt_contact                              "MyString"
  # additional_contact_ref_contact_name      "MyString"
  # additional_contact_ref_contact_value     "MyString"
  # contacts_ret_list_id                     "MyString"
  # customer_type_id				                "MyString"
  # terms_id				                        "MyString"
  # sales_rep_id				                    "MyString"
  balance                                 {Faker::Commerce.price}
  total_balance                            {Faker::Commerce.price}
  # sales_tax_code_id				               "MyString"
  # item_sales_tax_id				               "MyString"
  # resale_number                            "MyString"
  # account_number                           "MyString"
  credit_limit                             {Faker::Commerce.price}
  # preferred_payment_method_id				     "MyString"
  # credit_card_info_credit_card_number      "MyString"
  # credit_card_info_expiration_month        nil
  # credit_card_info_expiration_year         nil
  # credit_card_info_name_on_card            "MyString"
  # credit_card_info_credit_card_address     "MyString"
  # credit_card_info_credit_card_postal_code "MyString"
  # job_status                               "MyString"
  # job_start_date                           "2016-10-30"
  # job_projected_end_date                   "2016-10-30"
  # job_end_date                             "2016-10-30"
  # job_desc                                 "MyString"
  # job_type_id				                     "MyString"
  # notes                                    "MyText"
  # additional_notes_ret_note_id             "MyString"
  # preferred_delivery_method                "MyString"
  # price_level_id				                  "MyString"
  # external_guid                            "MyString"
  # currency_id				                     "MyString"
  # data_ext_ret_owner_id                    "MyString"
  # created_at                               "2016-10-30 14:04:52"
  # updated_at                               "2016-10-30 14:04:52"
end

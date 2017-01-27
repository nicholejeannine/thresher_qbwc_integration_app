class InvoiceLine < ApplicationRecord
end

# == Schema Information
#
# Table name: invoice_lines
#
#  id                                :string(255)      not null, primary key
#  invoice_id                        :string(255)
#  item_id                           :string(255)
#  item_full_name                    :string(255)
#  desc                              :text(65535)
#  quantity                          :decimal(10, 5)
#  unit_of_measure                   :string(255)
#  override_uom_set_id               :string(255)
#  override_uom_set_full_name        :string(255)
#  rate                              :decimal(15, 2)
#  rate_percent                      :float(24)
#  amount                            :decimal(15, 2)
#  inventory_site_id                 :string(255)
#  inventory_site_full_name          :string(255)
#  inventory_site_location_id        :string(255)
#  inventory_site_location_full_name :string(255)
#  serial_number                     :string(255)
#  lot_number                        :string(255)
#  service_date                      :date
#  sales_tax_code_id                 :string(255)
#  sales_tax_code_full_name          :string(255)
#

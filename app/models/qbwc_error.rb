class QbwcError < ApplicationRecord
end

# == Schema Information
#
# Table name: qbwc_errors
#
#  id            :integer          not null, primary key
#  model_name    :string(255)      not null
#  model_id      :string(255)
#  error_message :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

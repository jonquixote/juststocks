class Chart < ApplicationRecord
  extend FriendlyId
  friendly_id :strategy_name, use: :slugged
end

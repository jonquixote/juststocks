class LiveStrategiesStatistic < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  default_scope -> { order(created_at: :desc) }
end

class Webhook < ApplicationRecord
  has_one :strategy
  default_scope -> { order(created_at: :desc) }
end

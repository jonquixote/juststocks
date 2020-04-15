class HoldingsCurrent < ApplicationRecord
  belongs_to :strategy
  default_scope -> { order(created_at: :desc) }
end

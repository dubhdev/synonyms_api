class Synonym < ApplicationRecord
  include Discard::Model

  enum :status, { draft: 0, authorize: 1 }

  scope :order_created_at, -> { order(created_at: :desc) }
end

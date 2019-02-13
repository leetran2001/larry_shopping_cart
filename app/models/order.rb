class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def self.total_items
    pluck(:quantity).sum
  end

end

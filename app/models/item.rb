class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one :purchase_history
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :price
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
    validates :price, numericality: { only_integer: true, message: "Half-width number." }
  end
  with_options presence: true, numericality: { other_than: 0, message: "Select" } do
    validates :status_id 
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :category_id
  end

  def was_attached?
    self.image.attached?
  end
end

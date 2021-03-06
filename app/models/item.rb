class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_many :comments
  has_one :review
  has_many :likes
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  
  belongs_to_active_hash :item_status
  validates :name, :user_id,  :item_status_id, :shipping_fee_defrayer_id,  :ship_from_prefecture, :ship_date_id, :price, :description, presence: true 

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end


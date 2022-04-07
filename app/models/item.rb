class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :image, presence: true
  validates :name, presence: true
  validates :item_text, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shopping_cost_id, presence: true
  validates :state_id, presence: true
  validates :shopping_day_id, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_cost
  belongs_to :state
  belongs_to :shopping_day
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shopping_cost_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :state_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shopping_day_id, numericality: { other_than: 0, message: "can't be blank" }
end

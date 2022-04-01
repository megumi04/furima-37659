class Item < ApplicationRecord
  belongs_to :user

  # <<アクティブストレージの設定>>
  has_one_attached :image

# Active_hashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_day
  belongs_to :shipping_cost
  belongs_to :state

 #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0 , message: "Category can't be blank"}
  validates :status_id, numericality: { other_than: 0 , message: "Sales status can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 0 , message: "Shipping fee status can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 0 , message: "Prefecture can't be blank"}
  validates :state_id, numericality: { other_than: 0 , message: "Scheduled delivery can't be blank"}
end

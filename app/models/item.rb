class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :purchase, optional: true
  has_one_attached :image
  belongs_to :category
  belongs_to :item_status
  belongs_to :shopping_cost
  belongs_to :shopping_date
  belongs_to :prefecture

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shopping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shopping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/ }
end

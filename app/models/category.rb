class Category < ActiveRecord::Base
  attr_accessible :category_name, :user_id
  belongs_to :user
  has_many :courses, dependent: :destroy
  validates :user_id, presence: true
  validates  :category_name, presence: true
end

class Course < ActiveRecord::Base
  attr_accessible :coursedescription, :courseimage, :coursename, :coursetutor, :topics,:category_id
  belongs_to :user
  belongs_to :category
  acts_as_commentable
   letsrate_rateable "quality"
  validates :coursename, presence: true
  validates :coursetutor, presence:true
  validates  :coursedescription,presence: true
  validates  :topics,presence: true
  validates  :category_id,presence: true
end

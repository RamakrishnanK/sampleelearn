class RatingCache < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :cacheable, :polymorphic => true
end

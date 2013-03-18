class Rate < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :rater,:class_name => "User"
  belongs_to :rateable, :polymorphic => true
  
  attr_accessible :rate, :dimension
end

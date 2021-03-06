class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  include ActsAsCommentable::Comment
  attr_accessible :title, :comment
  belongs_to :commentable, :polymorphic => true
  default_scope :order => 'created_at DESC'

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :course
  belongs_to :user
end

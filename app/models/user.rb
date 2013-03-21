class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name,:email, :password, :password_confirmation, :remember_me,:provider, :phone,:user_type,:admin,:sub_plan,:user_desc
  # attr_accessible :title, :body
  # attr_accessible :title, :body
  has_many :authentication, :dependent => :delete_all
 has_many :courses, dependent: :destroy
 has_many :categories, dependent: :destroy
 letsrate_rater
  def apply_omniauth(auth)
	  # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email    = auth['info']['email']
   self.name     = auth['info']['name']
    self.image    = auth['info']['image']
    self.phone    = auth['info']['phone']
    self.provider = auth['provider']
	  # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
	  authentication.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
	end
end

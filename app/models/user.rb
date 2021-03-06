class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts
  has_many :categories

  has_one :user_configuration

  validates :email, presence: true

  enum role: [ :user, :admin ]

  def icategories
  	categories.select {
  		|category|
  		category.type == "Icategory"
  	}
  end
  def ecategories
  	categories.select {
  		|category|
  		category.type == "Ecategory"
  	}
  end
end

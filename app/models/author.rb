class Author < ApplicationRecord
  paginates_per 3
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :posts, dependent: :destroy
         has_many :coments, dependent: :destroy 
         has_one_attached :avatar

         
end

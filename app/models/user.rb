class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :tweets
         has_many :comments

         with_options presence: true do
           validates :name
         end
         validates :password, length: { minimum: 6 },confirmation: true,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/ }
end

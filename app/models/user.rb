class User < ApplicationRecord
  has_many :post
  validates :username, presence: true, 
    uniqueness: { case_sensitive: false }, 
    format: { with: /\A[a-zA-Z0-9_]{2,20}\z/, message: "ne doit contenir que des eractères alphanumeriques" }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, 
    length: {maximum: 255}, 
    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :password, presence: true, 
    length: { minimum:6,  maximum: 50}
  
  
  
  
  has_secure_password
  has_secure_token :token

  def to_session
    {id: id}
  end
end

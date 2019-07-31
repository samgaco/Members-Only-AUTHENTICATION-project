class User < ApplicationRecord
   attr_accessor :activation_token, :remember_token
   # before_save  email = email, only: [:create]
    #  before_save { self.email = email.downcase }
   before_create :create_activation_digest



    validates :name , presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false}, 
    format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    # validates :password , presence: true
    # validates :password_confirmation , presence: true

    def remember 
        self.remember_token = User.new_token
        update_attribute(:remember_digest , User.digest(remember_token)) 
    end 


    def create_activation_digest
        self.activation_token  = User.new_token
        self.remember_digest = User.digest(activation_token)
    end

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)     
    end 
    
    def User.new_token
        SecureRandom.urlsafe_base64
    end 
    def forget
        update_attribute(:remember_digest, nil)
    end  
end

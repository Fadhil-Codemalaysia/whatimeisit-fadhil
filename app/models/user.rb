class User < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true
    validates :email, format: { with: /\A\S+@\S+\.\S+\z/, message: 'must be a valid email address' }
end

class User < ApplicationRecord
    has_secure_password
    # Associations
    # Validations
    validates_presence_of(:name,:email,:password_digest)
    validates_uniqueness_of( :email)
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end

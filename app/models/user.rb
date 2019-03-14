class User < ApplicationRecord
  # Necessary for auth
  has_secure_password

  # Password validation
  validates_length_of :password, maximum: 15, minimum: 8, allow_nill: true, allow_blank: false
  validates_confirmation_of :password, allow_nill: true, allow_blank: false

  before_validation {
    (self.email = self.email.to_s.downcase) && (self.username = self.username.to_s.downcase)
  }

  # Check to see if email and username are present and unique.
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  # Method to give users permission to modify
  def can_modify_user?(user_id)
    role == 'admin' || id.to_s == user_id.to_s
  end

  # Methid to see if user is an admin or not
  def is_admin?
    role == 'admin'
  end

end

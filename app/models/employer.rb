class Employer < ActiveRecord::Base
  has_many :tags
  has_many :jobs
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    employer = find_by_email(email)
    if employer && employer.password_hash == BCrypt::Engine.hash_secret(password, employer.password_salt)
      employer
    else
      nil
    end
  end

end

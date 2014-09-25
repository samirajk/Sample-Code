class Jobseeker < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password
  has_many :jobapplications

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


  def self.authenticate(username, password)
    jobseeker = find_by_username(username)
    if jobseeker && jobseeker.password_hash == BCrypt::Engine.hash_secret(password, jobseeker.password_salt)
      jobseeker
    else
      nil
    end
  end
end

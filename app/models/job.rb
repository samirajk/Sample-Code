class Job < ActiveRecord::Base
  belongs_to :employer
  belongs_to :category

  has_many :job_applications
  has_many :tags
end

class Tag < ActiveRecord::Base
  has_many :jobs
  belongs_to :employer

  validates_uniqueness_of :tag
end

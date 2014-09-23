class Tag < ActiveRecord::Base
  has_many :jobs
  belongs_to :employer
end

class Jobapplication < ActiveRecord::Base
  belongs_to :job
  belongs_to :jobseeker

end

class Notifier < ActionMailer::Base
  default from: "notify@direwolf.com"

  def send_email_to_applicant(user,job,company)
    @user = user
    @job = job
    @company = company
    mail( :to => @user,
          :subject => 'Your Status to the Job : '+ @job + ' at ' + company + ' has been updated.' )
  end
  def send_email_to_employer(employer,job)
    @employer = employer
    @job = job
    mail( :to => @employer,
          :subject => 'There is a new Application to the Job : '+ @job )
  end

end

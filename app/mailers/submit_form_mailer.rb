class SubmitFormMailer < ApplicationMailer
  default :from => ENV['SCM_SENDER_EMAIL']
  def send_form_as_email()
    # process json from request of form submission here

    mail( :to => ENV['SCM_EMPLOYEE_EMAIL'],
          :subject => '' )
  end
end

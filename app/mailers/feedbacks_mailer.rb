class FeedbacksMailer < ApplicationMailer
  def completed_feedback(feedback)
    @admin = Admin.first
    @body = feedback.body

    mail to: "#{@admin.name} <#{@admin.email}>", subject: t('feedbacks.create.feedback_was_created')
  end
end

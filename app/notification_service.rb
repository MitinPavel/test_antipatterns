class NotificationService < Struct.new(:email_service, :sms_service)
  def notify_about(comment)
    email_service.deliver_new_comment_email comment
    sms_service.deliver_new_comment_sms comment
  end
end

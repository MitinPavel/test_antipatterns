class NotificationService < 
  Struct.new(:email_service, :sms_service, :author_repository)
  def comment_was_added(comment)
    author = author_repository.get comment.post.author_id
    email_service.deliver_new_comment_email comment, author
    sms_service.deliver_new_comment_sms comment, author
  end
end

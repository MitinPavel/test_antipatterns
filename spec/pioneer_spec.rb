require 'spec_helper'
require "#{File.dirname __FILE__}/../app/notification_service.rb"
require "#{File.dirname __FILE__}/../app/comment.rb"

describe NotificationService, "#notify_about" do
  before do
   @author, @author_repository, @email_service = mock, mock, mock
   @post = mock :author_id => 123
   @comment = Comment.new 'some text', @post
  end

  it "should notify the post author by email" do
    @author_repository.expects(:get).returns @author
    @email_service.expects(:deliver_new_comment_email).with @comment, @author
    @sms_service.expects :deliver_new_comment_sms

    notification_service.notify_about @comment
  end

  it "should notify the post author by sms" do
    @author_repository.expects(:get).returns @author
    @email_service.expects :deliver_new_comment_email
    @sms_service.expects(:deliver_new_comment_sms).with @comment, @author

    notification_service.notify_about @comment
  end

  def notification_service
    NotificationService.new @email_service, @sms_service, @author_repository
  end
end

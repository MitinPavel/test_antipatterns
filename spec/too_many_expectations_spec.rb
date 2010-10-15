require 'spec_helper'
require "#{File.dirname __FILE__}/../app/notification_service.rb"
require "#{File.dirname __FILE__}/../app/comment.rb"

describe NotificationService, "#notify_about" do
  before do
   @email_service, @sms_service = mock, mock
   @comment = Comment.new 'some text', 'dummy post'
   @notification_service = NotificationService.new @email_service, @sms_service
  end

  it "should notify the post author by email" do
    @email_service.expects(:deliver_new_comment_email).with @comment
    @sms_service.expects :deliver_new_comment_sms

    @notification_service.notify_about @comment
  end

  it "should notify the post author by sms" do
    @email_service.expects :deliver_new_comment_email
    @sms_service.expects(:deliver_new_comment_sms).with @comment

    @notification_service.notify_about @comment
  end
end

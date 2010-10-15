require 'spec_helper'
require "#{File.dirname __FILE__}/../app/notification_service.rb"

describe NotificationService, "#notify_about" do
  before do
    @sms_service, @email_service = stub_everything, stub_everything
    @notification_service = NotificationService.new @email_service, @sms_service
  end

  it "should notify the post author by email" do
    @email_service.expects(:deliver_new_comment_email).with @comment, @author
    @notification_service.notify_about @comment
  end

  it "should notify the post author by sms" do
    @sms_service.expects(:deliver_new_comment_sms).with @comment, @author
    @notification_service.notify_about @comment
  end
end

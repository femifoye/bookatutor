require 'BAT_Notifications'

class MessageObserver < ActiveRecord::Observer
    def after_save(record)
        sender = User.find(record.user_id)
        receiver = User.find(record.message_to)
        content = record
        @notification = BAT_Notification.new(sender, receiver, content)
        @notification = InboxNotification.new(@notification)
        @notification.send_notification_to_receiver
    end
  
  end
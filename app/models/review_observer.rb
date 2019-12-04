require 'BAT_Notifications'

class ReviewObserver < ActiveRecord::Observer
    def after_save(record)
        sender = User.find(record.user_id)
        receiver = User.find(record.reviewee)
        content = record
        debugger
        @notification = BAT_Notification.new(sender, receiver, content)
        @notification = ReviewNotification.new(@notification)
        
        @notification.send_notification_to_receiver

        @notification = UserReviewNotification.new(@notification)
        @notification.send_notification_to_sender
    end
  
  end
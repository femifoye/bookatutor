require 'BAT_Notifications'
require 'geocoder'
require 'certified'
require 'time'
#observer to notify user and user_booked when a booking is created
#"record" is the booking object being saved
class BookingObserver < ActiveRecord::Observer
    def after_save(record)
        sender = User.find(record.user_id)
        receiver = User.find(record.user_booked)
        content = record

        @notification = BAT_Notification.new(sender, receiver, content)
        @notification = BookingNotification.new(@notification)
        @notification.send_notification_to_receiver
        @notification = UserBookingNotification.new(@notification)
        @notification.send_notification_to_sender
    end
  
  end
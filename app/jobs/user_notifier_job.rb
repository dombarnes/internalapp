class UserNotifierJob < ActiveJob::Base
  queue_as :mailers

  def perform(*args)
    UserNotifier.new_user_notification(user).deliver_later
  end
end

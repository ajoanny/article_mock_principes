
class NotifyTrainStatusPort

  def initialize trains_port, train_status_notification_port
    @trains_port = trains_port
    @train_status_notification_port = train_status_notification_port
  end

  def execute id
    train = @trains_port.get(id)
    @train_status_notification_port.notify train
  end
end
require 'server_side/ORM/train'

class TrainsSqlAdapter < TrainsPort
  def get train_id
  end

  def save train
  end

  def create train
    ORM::Train.create! train
  end
end
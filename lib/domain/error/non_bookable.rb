class NonBookable < StandardError
  def initialize(seat)
    super
  end
end
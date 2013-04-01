class WorldPosition
  def initialize(unit_size)
    @unit_size = unit_size
  end

  def from_real_position(real_position)
    (real_position / @unit_size).floor
  end
end

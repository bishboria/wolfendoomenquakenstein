class Player
  attr_reader :height, :field_of_view, :position

  def initialize(height, field_of_view, position)
    @height = height
    @field_of_view = field_of_view
    @position = position
  end
end

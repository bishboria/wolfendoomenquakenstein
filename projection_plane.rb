class ProjectionPlane
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def center
    [width/2, height/2]
  end

  def distance_to(player)
    distance = (width/2) / Math.tan(player.field_of_view/2)
    return distance.floor
  end
end

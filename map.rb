require 'gosu'

class Map
  attr_reader :unit, :layout

  def initialize(gosu, unit, layout, collision, enemy)
    @gosu = gosu
    @unit = unit
    @layout_map = layout
    @collision_map = collision
    @enemy_map = enemy
  end

  def draw_(positionable)
    center = positionable.position
    @layout_map.each_with_index do |x, i|
      x.each_with_index do |y, j|
        @gosu.draw_quad(i*@unit, j*@unit, r_color(),
                        i*@unit, (j+1)*@unit, r_color(),
                        (i+1)*@unit, (j+1)*@unit, r_color(),
                        (i+1)*@unit, j*@unit, r_color(), 0)
      end
    end
  end

  def update_()
  end

  def r_color()
    Gosu::Color.rgb(rand(255),
                    rand(255),
                    rand(255))
  end
end

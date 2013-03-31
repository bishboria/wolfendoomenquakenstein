require 'gosu'

class Map
  def initialize(gosu, config, maploader)
    @gosu = gosu
    @config = config
    @world_width = config["window_width"]
    @unit = config["unit_size"]
    @layout_map = maploader.load(config["layout_filename"])
    @collision_map = maploader.load(config["collision_filename"])
    @enemy_map = maploader.load(config["enemy_filename"])
  end

  def draw_(tiles, positionable)
    @layout_map.each_with_index do |x, i|
      x.each_with_index do |y, j|
        tiles[@layout_map[i][j].hex].draw(i*@unit, j*@unit, 0)
      end
    end
  end

  def update_(positionable)
    @layout_map = MapLoader.load(@config["layout_filename"])
    @collision_map = MapLoader.load(@config["collision_filename"])
    collision_logic(positionable)
  end

  def world_pos(value)
    (value / @unit).floor
  end

  def collision_logic(positionable)
    bottom_left = @collision_map[world_pos(positionable.left_x)][world_pos(positionable.bottom_y)]

    if positionable.left_x <= 0
      positionable.left_x = 0
    end

    if positionable.right_x >= @world_width
      positionable.right_x = @world_width
    end

    if positionable.top_y < 0
      positionable.bottom_y = 0
    end

    if bottom_left == "4"
      positionable.velocity.y = 0
      positionable.top_y = world_pos(positionable.bottom_y)*@unit
    else
      positionable.velocity.y += 1
    end
  end
end

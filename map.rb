require_relative './collision_types'

class Map
  def initialize(gosu, config, maploader, world_pos)
    @gosu = gosu
    @config = config
    @world_width = config["window_width"]
    @layout_map = maploader.load(config["layout_filename"])
    @collision_map = maploader.load(config["collision_filename"])
    @enemy_map = maploader.load(config["enemy_filename"])

    @unit = config["unit_size"]
    @world_pos = world_pos.new(@unit)

    @collision_1a = Collision_1A.new(@world_pos)
    @collision_1b = Collision_1B.new(@world_pos)
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

  def collision_logic(positionable)
    InBounds.new(@world_width).ensure(positionable)

    if @collision_1a.check(@collision_map, positionable)
      positionable.velocity.y = 0
      positionable.top_y = @world_pos.from_real_position(positionable.bottom_y)*@unit
    else
      positionable.velocity.y += 1
    end

    if @collision_1b.check(@collision_map, positionable)
      positionable.velocity.y -= 20
    end
  end
end

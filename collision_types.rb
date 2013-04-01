class Collision
  def initialize(config, world_pos, maploader)
    @config = config
    @unit = config["unit_size"]
    @world_pos = world_pos
    @maploader = maploader
    @collision_map = maploader.load(config["collision_filename"])
    @world_width = config["world_width"]
    @collision_1a = Collision_1A.new(world_pos)
    @collision_1b = Collision_1B.new(world_pos)
  end

  def update_(positionable)
    @collision_map = maploader.load(config["collision_filename"])

    InBounds.new(world_width).ensure(positionable)

    if @collision_1a.check(collision_map, positionable)
      positionable.velocity.y = 0
      positionable.top_y = world_pos.from_real_position(positionable.bottom_y)*unit
    else
      positionable.velocity.y += 1
    end

    if @collision_1b.check(collision_map, positionable)
      positionable.velocity.y -= 20
    end
  end

  private

  attr_reader :unit, :collision_map, :world_width, :world_pos, :maploader, :config
end

class Collision_1A
  def initialize(world_pos)
    @world_pos = world_pos
  end

  def check(collision_map, thing)
    if thing.falling?
      lx = @world_pos.from_real_position(thing.left_x)
      rx = @world_pos.from_real_position(thing.right_x)
      by = @world_pos.from_real_position(thing.bottom_y)

      bl = collision_map[lx][by]
      br = collision_map[rx][by]

      if (bl == "1" || br == "1")
        return true
      end
    end
    return false
  end
end

class Collision_1B
  def initialize(world_pos)
    @world_pos = world_pos
  end

  def check(collision_map, thing)
    if thing.jumping?
      lx = @world_pos.from_real_position(thing.left_x)
      rx = @world_pos.from_real_position(thing.right_x)
      by = @world_pos.from_real_position(thing.bottom_y)

      bl = collision_map[lx][by]
      br = collision_map[rx][by]

      if (bl == "1" || br == "1")
        return true
      end
    end
    return false
  end
end

class InBounds
  def initialize(world_width)
    @world_width = world_width
  end

  def ensure(thing)
    if thing.left_x <= 0
      thing.left_x = 0
    elsif thing.right_x >= @world_width
      thing.right_x = @world_width
    end

    if thing.top_y < 0
      thing.bottom_y = 0
    end
  end
end

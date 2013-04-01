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

      if thing.falling? && (bl == "1" || br == "1")
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

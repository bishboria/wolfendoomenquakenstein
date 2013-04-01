class Player
  def initialize(position, size, velocity, images, scale_x=1, scale_y=1)
    @position = position
    @size = size
    @velocity = velocity
    @images = images
    @scale_x = scale_x
    @scale_y = scale_y
    @to_edge = @size / 2
  end

  def center
    @position
  end

  def velocity
    @velocity
  end

  def falling?
    @velocity.y > 0
  end

  def jumping?
    @velocity.y < 0
  end

  def moving_left?
    @velocity.x < 0
  end

  def left_x
    @position.x - @to_edge
  end

  def left_x=(x)
    @position.x = x + @to_edge
  end

  def right_x
    @position.x + @to_edge - 1
  end

  def right_x=(x)
    @position.x = x - @to_edge
  end

  def top_y
    @position.y - @to_edge
  end

  def top_y=(y)
    @position.y = y - @to_edge
  end

  def bottom_y=(y)
    @position.y = y + @to_edge - 1
  end

  def bottom_y
    @position.y + @to_edge
  end

  def update_(input)
    if input.left? && @velocity.x > -10
      @velocity.x -= 1
    elsif input.right? && @velocity.x < 10
      @velocity.x += 1
    else
      @velocity.x *= 0.9
    end

    if input.up? && @velocity.y > -10
      @velocity.y -= 4
    elsif input.down? && @velocity.y < 10
      @velocity.y += 1
    else
      @velocity.y *= 0.9
    end

    @position.x += @velocity.x
    @position.y += @velocity.y
  end

  def draw_()
    @images[38].draw(self.left_x, self.top_y, 0, factor_x=1, factor_x=1)
  end
end

class Player
  def initialize(position, size, velocity, images, scale_x=1, scale_y=1)
    @position = position
    @size = size
    @velocity = velocity
    @images = images
    @scale_x = scale_x
    @scale_y = scale_y
  end

  def position
    @position
  end

  def top_left_x
    @position.x - (@size / 2)
  end

  def top_left_y
    @position.y - (@size / 2)
  end

  def bottom_right_x
    @position.x + (@size / 2)
  end

  def bottom_right_y
    @position.y + (@size / 2)
  end

  def update_(input)
    if input.left? && @velocity.x > -10
      @velocity.x -= 1
    elsif input.right? && @velocity.x < 10
      @velocity.x += 1
    elsif input.up? && @velocity.y > -10
      @velocity.y -= 1
    elsif input.down? && @velocity.y < 10
      @velocity.y += 1
    else
      @velocity.x *= 0.9
      @velocity.y *= 0.9
    end
    #if input.enter? && @position.vy < 13
      #@position.vy -= -3
    #end

    # gravity
    #@velocity.y -= 1

    @position.x += @velocity.x
    @position.y += @velocity.y
  end

  def draw_()
    @images[0].draw(@position.x, @position.y, 0, factor_x=5, factor_x=6)
  end
end

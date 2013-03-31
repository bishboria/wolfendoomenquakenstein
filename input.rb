require 'gosu'

class Input
  def initialize(gosu)
    @gosu = gosu
    @state = {}
  end

  # Can't call it input as Gosu crashes if the class
  # doesn't inherit from Gosu::Window...
  def update_()
    @state[:left]    = @gosu.button_down?(Gosu::KbLeft)
    @state[:right]   = @gosu.button_down?(Gosu::KbRight)
    @state[:up]      = @gosu.button_down?(Gosu::KbUp)
    @state[:down]    = @gosu.button_down?(Gosu::KbDown)
    @state[:space]   = @gosu.button_down?(Gosu::KbSpace)
    @state[:enter]   = @gosu.button_down?(Gosu::KbEnter)
  end

  def left?
    @state[:left]
  end

  def right?
    @state[:right]
  end

  def up?
    @state[:up]
  end

  def down?
    @state[:down]
  end

  def space?
    @state[:space]
  end

  def enter?
    @state[:enter]
  end
end

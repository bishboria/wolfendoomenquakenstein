require 'gosu'
require 'date'

require_relative 'input'
require_relative 'maploader'
require_relative 'map'
require_relative 'player'
require_relative 'position'
require_relative 'scalar'
require_relative 'velocity'
require_relative 'weather'

class Game < Gosu::Window
  def initialize(config)

    super(config["window_width"], config["window_height"], config["fullscreen"])

    @background = Gosu::Image.new(self, Weather.image_for_current_weather, true)

    self.caption = config["window_title"]

    @game_map = Map.new(self, config, MapLoader)

    @unit_size = config["unit_size"]
    @tiles = Gosu::Image.load_tiles(self, config["tileset_filename"], @unit_size, @unit_size, tileable=true)
    @input = Input.new(self)
    @player = Player.new(Position.new(@unit_size/2,@unit_size/2), @unit_size, Velocity.new(0,0), @tiles)
  end

  def update()
    @input.update_()
    @player.update_(@input)
    @game_map.update_(@player)
  end

  def draw()
    @background.draw(0,0,0)
    @game_map.draw_(@tiles, @player)
    @player.draw_()
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

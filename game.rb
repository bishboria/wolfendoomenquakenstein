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
require_relative 'collision_types'
require_relative 'world_position'

class Game < Gosu::Window
  def initialize(config)

    super(config["window_width"], config["window_height"], config["fullscreen"])

    @background = Gosu::Image.new(self, Weather.image_for_current_weather, true)

    self.caption = config["window_title"]

    @map = Map.new(config, MapLoader)
    @unit_size = config["unit_size"]
    @collision_thing = Collision.new(config, WorldPosition.new(@unit_size), MapLoader)

    @tiles = Gosu::Image.load_tiles(self, config["tileset_filename"], @unit_size, @unit_size, tileable=true)
    @input = Input.new(self)
    start_position = Position.new(@unit_size/2.0,@unit_size*27.0)
    @player = Player.new(start_position, @unit_size, Velocity.new(0,0), @tiles)
  end

  def update()
    @map.update_()
    @input.update_()
    @player.update_(@input)
    @collision_thing.update_(@player)
  end

  def draw()
    @background.draw(0,0,0)
    @map.draw_(@tiles)
    @player.draw_()
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

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

    @unit_size = config["unit_size"]
    self.caption = config["window_title"]
    @game_map = Map.new(self, config["unit_size"],
                        MapLoader.load(config["layout_filename"]),
                        MapLoader.load(config["collision_filename"]),
                        MapLoader.load(config["enemy_filename"]))
    @tiles = Gosu::Image.load_tiles(self, config["tileset_filename"], config["unit_size"], config["unit_size"], tileable=true)
    @input = Input.new(self)
    @player = Player.new(Position.new(0,0), config["unit_size"], Velocity.new(0,0), @tiles)
  end

  def update()
    @input.update_()
    @player.update_(@input)
  end

  def draw()
    @background.draw(0,0,0)
    @game_map.draw_(@player)
    #@tiles.each_with_index do |t, i|
      #scale=4
      #t.draw(i*@unit_size*scale, i*@unit_size*scale, 0,
             #factor_x=4, factor_y=4)
    #end
    @player.draw_()
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

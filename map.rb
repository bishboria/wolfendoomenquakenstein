require_relative './collision_types'

class Map
  def initialize(config, maploader)
    @config = config
    @maploader = maploader
    @layout_map = maploader.load(config["layout_filename"])

    @unit = config["unit_size"]
  end

  def draw_(tiles)
    layout_map.each_with_index do |x, i|
      x.each_index do |j|
        tiles[layout_map[i][j].hex].draw(i*unit, j*unit, 0)
      end
    end
  end

  def update_()
    layout_map = maploader.load(config["layout_filename"])
  end

  private

  attr_reader :layout_map, :maploader, :config, :unit
end

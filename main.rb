require "yaml"
require_relative "game"

config = YAML.load_file("./config/game.conf")

Game.new(config).show

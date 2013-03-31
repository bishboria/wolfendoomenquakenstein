require "net/http"
require "uri"
require "json"

class Background
  def initialize
    @base_url = "http://api.wunderground.com/api/c8be34f7c0e967fb/"
  end

  def local_weather
  end

  def weather(city)
    @base_url + "conditions"
  end
end

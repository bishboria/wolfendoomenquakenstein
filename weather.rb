require "net/http"
require "uri"
require "json"

class Weather
  def self.image_for_current_weather
    "./media/#{current_weather}.jpg"
  end

  private

  def self.current_weather
    JSON.parse(request_weather_data)["current_observation"]["weather"]
  end

  def self.request_weather_data
    Net::HTTP.get_response(URI.parse("http://api.wunderground.com/api/c8be34f7c0e967fb/conditions/q/CA/San_Francisco.json")).body
  end
end

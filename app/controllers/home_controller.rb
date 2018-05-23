class HomeController < ApplicationController
  def index
    require 'httparty'
    require 'json'

    url = 'http://api.musixmatch.com/ws/1.1/track.search?apikey=03d5f80e88e40ca17ea9d78f326c84ee&q_artist=vald&page_size=3&page=1&s_track_rating=desc'
    response = HTTParty.get(url)
    @artist = JSON.parse(response.parsed_response)["message"]["body"]["track_list"][0]["track"]["artist_name"]
    # tracks = JSON.parse(response.parsed_response)["message"]["body"]["track_list"]
    # tracks.each do |track|
    #
    # end
  end
end

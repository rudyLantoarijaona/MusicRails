class ApiController < ApplicationController

  def index

    if params[:trackId]

      lyrics = getLyricsgById(params[:trackId])
      track = getTrackById(params[:trackId])
      trackContent = Array.new
      trackContent.push(lyrics["lyrics_body"])
      trackContent.push(track["track_name"])
      trackContent.push(track["artist_name"])
      trackContent.push(track["album_coverart_100x100"])
      @track = trackContent

    else

      showSongs = Array.new
      if params[:q]
        songs = getSongsByArtist(params[:q]);
        songs.each do | song |
          oneSong = Array.new
          oneSong.push(song["track"]["track_name"])
          oneSong.push(song["track"]["artist_name"])
          oneSong.push(song["track"]["album_coverart_100x100"])
          oneSong.push(song["track"]["track_id"])
          showSongs.push(oneSong)
        end
      end
      @songs = showSongs
      @query = params[:q] || ""

    end
  end

  def getSongsByArtist(artistName)
    require 'httparty'
    require 'json'

    endPointUrl = 'http://api.musixmatch.com/ws/1.1/';

    url = endPointUrl + 'track.search?apikey=03d5f80e88e40ca17ea9d78f326c84ee&q_artist=' + artistName + '&page_size=3&page=1&s_track_rating=desc';
    response = HTTParty.get(url)
    return JSON.parse(response.parsed_response)["message"]["body"]["track_list"]
  end

  def getLyricsgById(idTrack)
    require 'httparty'
    require 'json'

    endPointUrl = 'http://api.musixmatch.com/ws/1.1/';

    url = endPointUrl + 'track.lyrics.get?apikey=03d5f80e88e40ca17ea9d78f326c84ee&track_id=' + idTrack;
    response = HTTParty.get(url)
    return JSON.parse(response.parsed_response)["message"]["body"]["lyrics"]
  end

  def getTrackById(idTrack)
    require 'httparty'
    require 'json'

    endPointUrl = 'http://api.musixmatch.com/ws/1.1/';

    url = endPointUrl + 'track.get?apikey=03d5f80e88e40ca17ea9d78f326c84ee&track_id=' + idTrack;
    response = HTTParty.get(url)
    return JSON.parse(response.parsed_response)["message"]["body"]["track"]
  end
end

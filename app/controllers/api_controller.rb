class ApiController < ApplicationController

  def index

    if params[:trackId]

      lyrics = getLyricsgById(params[:trackId])
      track = getTrackById(params[:trackId])

      resultTrim = trimLyrics(lyrics["lyrics_body"], 3);

      trackContent = Array.new

      trackContent.push(resultTrim[0])
      trackContent.push(track["track_name"])
      trackContent.push(track["artist_name"])
      trackContent.push(track["album_coverart_100x100"])
      trackContent.push(resultTrim[1])
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

  def trimLyrics(lyrics, level)

    lyrics_line = lyrics.split("\n")
    i = 0
    lyrics_line.each do | line |
      lyrics_line[i] = line+"<br>"
      i = i+1
    end
    lyrics = lyrics_line.join(" ")
    lyrics_word = lyrics.split(" ")
    valid_words = Array.new

    while level > 0 do
       rand = rand(lyrics_word.length)
           puts lyrics_word[rand]
       valid_words.push(lyrics_word[rand])
       lyrics_word[rand] = "<input type='text' style='display: inline'></input>"
       level -= 1
    end

    result = Array.new
    result.push(lyrics_word.join(" ").html_safe, valid_words)

    return result
    
  end
end

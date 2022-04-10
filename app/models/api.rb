require 'HTTParty'
require 'json'
require 'dotenv'
Dotenv.load('./.env')

class Api < ApplicationRecord
  def self.fetch_marvel

    apikey = ENV['MARVEL_API_TOKEN']
    hash = ENV['MARVEL_HASH_TOKEN']
    url = "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=" + apikey + "&limit=100&hash=" + hash
    response = HTTParty.get(url , :headers => { 'Accept' => 'application/json' } )
    json = JSON.parse(response.body)
    return json["data"]["results"]
  end
end

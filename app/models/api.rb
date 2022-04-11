require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load('./.env')

class Api < ApplicationRecord
  def self.fetch_marvel

    apikey = ENV['MARVEL_API_TOKEN']
    hash = ENV['MARVEL_HASH_TOKEN']
    url = "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=" + apikey + "&limit=100&hash=" + hash
    response = HTTParty.get(
      url, 
      :headers => { 'Accept' => 'application/json' } 
    )
    json = JSON.parse(response.body)
    return json["data"]["results"]
  end

  def self.fetch_credly
    apikey = ENV['CREDLY_API_TOKEN']
    url = "https://sandbox-api.credly.com/v1/organizations/f6d0716e-484e-48df-9165-866228215b32/badge_templates"
    response = HTTParty.get(
      url, 
      :basic_auth => { username: apikey, password: "" },
      :headers => { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    )
    json = JSON.parse(response.body)
    return json["data"]
  end
end

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
      :basic_auth => { 'username' => apikey, 'password' => '' },
      :headers => { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    )
    json = JSON.parse(response.body)
    return json["data"]
  end

  def self.post_credly_badge_1(id, name)
    apikey = ENV['CREDLY_API_TOKEN']
    url = 'https://sandbox-api.credly.com/v1/organizations/f6d0716e-484e-48df-9165-866228215b32/badges'
    options = {
      :basic_auth => { 'username' => apikey, 'password' => '' },
      :headers => {  'Accept' => 'application/json', 'Authorization' => 'Basic ' + apikey + '=', 'Content-Type' => 'application/json' },
      :body => { 
        :badge_template_id => '251f322f-e9fa-41c2-9675-11b6dddbd696', 
        :issued_at => Time.now,
        :issued_to_first_name => name,
        :issued_to_last_name => id,
        :recipient_email => 'marvel-' + id + '@gmail.com'
      }.to_json
    }
    response = HTTParty.post(url, options)
    json = JSON.parse(response.body)
    p response
    return json["data"]
  end

  def self.post_credly_badge_2(id, name)
    apikey = ENV['CREDLY_API_TOKEN']
    url = "https://sandbox-api.credly.com/v1/organizations/f6d0716e-484e-48df-9165-866228215b32/badges"
    options = {
      :basic_auth => { 'username' => apikey, 'password' => '' },
      :headers => { 'Content-Type' => 'application/json' },
      :body => { 
        :badge_template_id => '61b7c61d-cfb5-424c-b175-a51267d06f52', 
        :issued_at => Time.now,
        :issued_to_first_name => name,
        :issued_to_last_name => id,
        :recipient_email => 'marvel-' + id + '@gmail.com'
      }.to_json
    }
    response = HTTParty.post(url, options)
    json = JSON.parse(response.body)
    return json["data"]
  end
end

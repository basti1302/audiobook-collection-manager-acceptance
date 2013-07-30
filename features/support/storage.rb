#encoding: utf-8
require 'rest_client'

def delete_database(url)
  RestClient.delete url
end

def upload_fixtures(url, filename)

  # read file line by line
  file = File.open(filename)
  lines = []
  file.each do |line|
    lines << line
  end
  file.close

  # post data to backend
  lines.each do |line|
    RestClient.post url, line, :content_type => :json, :accept => :json
  end
end

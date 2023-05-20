
require 'uri'
require 'net/http'
require 'openssl'


require 'json'

#checks if user currently exists
def check(user_email, user_phone_number)
  api_key = "pk_51ca0a0d5efd7ba50730d4dd698375bc7c"
  url = URI("https://a.klaviyo.com/api/v2/list/R2t5tv/get-members?api_key=#{api_key}")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Post.new(url)
  request["accept"] = "application/json"
  request["content-type"] = "application/json"
  request.body = "{\"emails\":[\"#{user_email}\"],\"phone_numbers\":[\"#{user_phone_number}\"]}"

  response = http.request(request)
  response_body = JSON.parse(response.read_body)

  return response_body.empty?
end

#adds user
def add_members (first_name,last_name,phone_number,email,date_of_birth)
    api_key = "pk_51ca0a0d5efd7ba50730d4dd698375bc7c"
    url = URI("https://a.klaviyo.com/api/v2/list/R2t5tv/members?api_key=#{api_key}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["accept"] = 'application/json'
    request["content-type"] = 'application/json'
    request.body = "{\"profiles\":[{\"email\":\"#{email}\",\"first_name\":\"#{first_name}\",\"last_name\":\"#{last_name}\",\"phone_number\":\"#{phone_number}\",\"date_of_birth\":\"#{date_of_birth}\"}]}"


    response = http.request(request)
    

end
  


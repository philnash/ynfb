require 'net/https'

module Scrobbler2
  module REST
  	class Connection
  		def initialize(base_url, api_key, args = {})
  			@base_url = base_url
  			@api_key = api_key
  			@username = args[:username]
  			@password = args[:password]
  		end

  		def get(resource, args = nil)
  			request(resource, "get", args)
  		end

  		def post(resource, args = nil)
  			request(resource, "post", args)
  		end

  		def request(resource, method = "get", args = {})
  		  url = URI.parse(@base_url)
  		  args = args.merge(:api_key => @api_key, :method => resource)
  			if args
  				# TODO: What about keys without value?
  				url.query = args.map { |k,v| "%s=%s" % [URI.encode(k.to_s), URI.encode(v.to_s)] }.join("&")
  			end
  			headers = { "User-Agent" => "Ruby/1.8.6 Scrobbler2" }
  			case method
  			when "get"
  				req = Net::HTTP::Get.new(url.request_uri, headers)
  			when "post"
  				req = Net::HTTP::Post.new(url.request_uri, headers)
  			end

  			if @username and @password
  				req.basic_auth(@username, @password)
  			end

  			http = Net::HTTP.new(url.host, url.port)
  			http.use_ssl = (url.port == 443)

  			res = http.start() { |conn| conn.request(req) }
  			res.body
  		end
  	end
  end
end
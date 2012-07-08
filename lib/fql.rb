require "net/http"

module Fql
  BASE_URL = 'https://graph.facebook.com/fql?q='

  def self.execute(fql_query, options = {})
    url = make_url(fql_query, options)
    response = make_request url 
    self.decode_response response
  end

  def self.make_url(fql_query, options = {})
    url = self::BASE_URL + URI.encode(fql_query.compose)
    if options.has_key?(:access_token)
      url += "&access_token=#{options[:access_token]}"
    end
    URI.parse url
  end

  protected
  def self.make_request(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    # TODO Should use VERIFY_PEER in production
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE 
    request = Net::HTTP::Get.new(uri.request_uri)
    http.request(request)
  end

  protected
  def self.decode_response(response)
    json = ActiveSupport::JSON
    decoded_json = json.decode response.body
    decoded_json["data"]
  end

end
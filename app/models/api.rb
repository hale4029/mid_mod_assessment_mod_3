require 'faraday'
require 'json'

class API
  attr_reader :house

  def initialize(house)
    @conn = Faraday.new(
      url: 'https://www.potterapi.com/v1/',
      params: {key: ENV['POTTER_API']})
    @house = house
  end

  def members_in_order_of_the_phoenix
    resp = @conn.get("characters?house=#{@house}&orderOfThePhoenix=true")
    JSON.parse(resp.body)
  end

end

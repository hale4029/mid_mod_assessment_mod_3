require 'faraday'
require 'json'

class API
  attr_reader :house

  def initialize(house)
    @conn = Faraday.new(
      url: 'https://www.potterapi.com/v1/',
      params: {key: '$2a$10$GRjvbsLBFsY3O04xp977yOhFKS0a0TQ0C0WeTMDGDyAsU3fJ6rFy6'})
    @house = house
  end

  def members_in_order_of_the_phoenix
    resp = @conn.get("characters?house=#{@house}&orderOfThePhoenix=true")
    JSON.parse(resp.body)
  end

end

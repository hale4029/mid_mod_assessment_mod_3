require 'faraday'
require 'json'

class API

  def intialize
    @conn = Faraday.new(
      url: 'https://www.potterapi.com/v1/',
      params: {key: '$2a$10$GRjvbsLBFsY3O04xp977yOhFKS0a0TQ0C0WeTMDGDyAsU3fJ6rFy6'})
  end

  def characters
    resp = @conn.get('characters')
    characters = JSON.parse(resp.body)
  end

end

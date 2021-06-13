class TeamMateService
  def self.my_mates(count)
    response = conn.get('/api/v1/characters/random') do |req|
      req.params['count'] = count
    end

    JSON.parse(response.body, symbolize_names: true).sample(3)
  end

  def self.conn
    Faraday.new(url: 'http://last-airbender-api.herokuapp.com')
  end
end
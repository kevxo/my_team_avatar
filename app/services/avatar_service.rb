class AvatarService
  def self.all_avatars
    response = conn.get('/api/v1/characters/avatar')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://last-airbender-api.herokuapp.com')
  end
end

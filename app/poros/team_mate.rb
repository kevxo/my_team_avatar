class TeamMate
  attr_reader :id, :name, :position, :weapons, :profession

  def initialize(data)
    @id = data[:_id]
    @name = data[:name]
    @position = data[:position]
    @weapons = data[:weapon]
    @profession = data[:profession]
  end
end

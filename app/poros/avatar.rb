class Avatar
  attr_reader :id, :name, :weapons, :profession

  def initialize(data)
    @id = data[:_id]
    @name = data[:name]
    @weapons = data[:weapon]
    @profession = data[:profession]
  end
end
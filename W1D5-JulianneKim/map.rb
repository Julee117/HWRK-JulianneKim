class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.empty?
      @map << [key, value]
    end
    (0...@map.length).each do |x|
      @map << [key, value] unless @map[x].include?(key)
    end
    @map
  end

  def lookup(key)
    (0...@map.length).each do |x|
      if @map[x][0] == key
        return @map[x][1]
      end
    end
    nil
  end

  def remove(key)
    @map.reject { |pair| pair[0] == key }
  end

  def show
    @map.dup
  end
end

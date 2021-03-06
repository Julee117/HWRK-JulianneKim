class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      if cup.empty? && idx != 6 && idx != 13
        4.times do
          cup << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 7
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_index = start_pos
    until stones.empty?
      cup_index += 1
      cup_index = 0 if cup_index > 13
      if cup_index == 6
        @cups[6] << stones.shift if current_player_name == @name1
      elsif cup_index == 13
        @cups[13] << stones.shift if current_player_name == @name2
      else
        @cups[cup_index] << stones.shift
      end
    end

    render
    next_turn(cup_index)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    if @cups[6].count > @cups[13].count
      @name1
    elsif @cups[6].count < @cups[13].count
      @name2
    else
      :draw
    end
  end
end

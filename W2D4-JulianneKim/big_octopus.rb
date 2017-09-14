FISH_ARR = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh',
  'fsh', 'fiiiissshhhhhh']

def sluggish
  longest = FISH_ARR[0]

  (0...FISH_ARR.length).each do |x|
    (x + 1...FISH_ARR.length).each do |y|
      if FISH_ARR[y].length > FISH_ARR[x].length && FISH_ARR[y].length > longest.length
        longest = FISH_ARR[y]
      end
    end
  end
  longest
end

class Array
  def quicksort(&prc)
    copy = self.dup
    prc ||= Proc.new { |x, y| x <=> y }
    pivot = copy.pop
    lesser = []
    greater = []
    (0...copy.length).each do |x|
      if prc.call(copy[x], pivot) <= 0
        lesser << copy[x]
      else
        greater << copy [x]
      end
    end
    lesser.quicksort(&prc) + [pivot] + greater.quicksort(&prc)
  end
end


def linear(fish)
  longest = ""
  (0...fish.length).each do |x|
    if longest == nil || fish[x].length > longest.length
      longest = fish[x]
    end
  end
  longest
end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |dir, idx|
    if tile == direction
      return idx
    end
  end
end

def contest(direction)
  tile_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
    "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7}
   tile_hash[direction]
end

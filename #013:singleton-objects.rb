# https://www.rubytapas.com/2012/10/22/episode-013-singleton-objects/

#######################################################################################

LIVE_CELL = Object.new
class << LIVE_CELL
  def to_s() 'o' end

  def next_generation(x, y, board)
    require "pry", binding.pry
    case board.neighbors(x, y).count(LIVE_CELL)
    when 2..3 then self
    else DEAD_CELL
    end
  end
end

DEAD_CELL = Object.new
class << DEAD_CELL
  def to_s() '.' end

  def next_generation(x, y, board)
    case board.neighbors(x, y).count(LIVE_CELL)
    when 3 then LIVE_CELL
    else self
    end
  end
end

[[DEAD_CELL, LIVE_CELL, LIVE_CELL, DEAD_CELL]]

#######################################################################################

class << (LIVE_CELL = Object.new)
  def to_s() 'o' end

  def next_generation(x, y, board)
    require "pry", binding.pry
    case board.neighbors(x, y).count(LIVE_CELL)
    when 2..3 then self
    else DEAD_CELL
    end
  end
end

class << (DEAD_CELL = Object.new)
  def to_s() '.' end

  def next_generation(x, y, board)
    case board.neighbors(x, y).count(LIVE_CELL)
    when 3 then LIVE_CELL
    else self
    end
  end
end

[[DEAD_CELL, LIVE_CELL, LIVE_CELL, DEAD_CELL]]

#######################################################################################

module LiveCell
  def self.to_s() 'o' end

  def self.next_generation(x, y, board)
    require "pry", binding.pry
    case board.neighbors(x, y).count(LiveCell)
    when 2..3 then self
    else DeadCell
    end
  end
end

module DeadCell
  def self.to_s() '.' end

  def self.next_generation(x, y, board)
    case board.neighbors(x, y).count(LiveCell)
    when 3 then LiveCell
    else self
    end
  end
end

[[DeadCell, LiveCell, LiveCell, DeadCell]]

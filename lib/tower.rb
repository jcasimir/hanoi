class Tower
  attr_accessor :discs, :name

  def initialize(name)
    @name = name
    @discs = []
  end

  def can_support?(incoming)
    incoming.size < self.top.size
  end

  def top
    discs.first
  end

  def stack(input)
    discs.unshift(input)
  end

  def take
    discs.shift
  end

  def empty?
    discs.empty?
  end
end
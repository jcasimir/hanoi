class Tower
  attr_accessor :discs, :name

  def initialize(name)
    @name = name
  end

  def can_support?(incoming)
    incoming.size < self.top.size
  end

  def top
    discs.first
  end

end
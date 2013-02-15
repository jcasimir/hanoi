class InvalidStackError < StandardError; end

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
    discs.unshift(input) && validate!
  end

  def take
    discs.shift
  end

  def empty?
    discs.empty?
  end

  def validate!
    valid? || raise(InvalidStackError)
  end

  def valid?
    sizes = discs.map{|d| d.size}
    sizes == sizes.sort
  end

  def size
    discs.size
  end
end
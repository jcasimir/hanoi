class Disc
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def to_s
    size.to_s
  end
end
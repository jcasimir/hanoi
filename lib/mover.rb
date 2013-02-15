class Mover
  def self.move_from_a_to_b(a, b)
    if can_move_from_a_to_b?(a, b)
      b.stack(a.take)
    end
  end

  def self.can_move_from_a_to_b?(a, b)
    b.empty? || (a.top.size < b.top.size)
  end
end
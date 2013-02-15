class Mover
  def self.move_from_a_to_b(a, b)
    b.stack(a.take)
  end

end
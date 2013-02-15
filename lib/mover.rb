class Mover
  def self.move_from_a_to_b(a, b)
    can_move_from_a_to_b?(a, b) && b.stack(a.take)
  end

  def self.can_move_from_a_to_b?(a, b)
    !a.empty? && (b.empty? || (a.top.size < b.top.size))
  end

  def self.move_from_a_to_b_via_c(height, x, z, y)    
    TowerPrinter.print([x, y, z])

    if height == 1
      move_from_a_to_b(x,z)
    else
      move_from_a_to_b_via_c(height - 1, x, y, z)
      move_from_a_to_b(x, z)
      move_from_a_to_b_via_c(height - 1, y, z, x)
    end

    TowerPrinter.print([x, y, z])    
  end

  def self.next_move_for(x, y, z)
    moves_from = [x, y, z].sort_by{|tower| [tower.size, tower.top.size] }.last
    moves_to   = [x, y, z].detect{|target| can_move_from_a_to_b?(moves_from, target)}
    [moves_from, moves_to]
  end
end
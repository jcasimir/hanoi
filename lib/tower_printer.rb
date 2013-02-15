class TowerPrinter

  def self.print(towers)
    puts
    towers = towers.sort_by{|t| t.name}
    discs = towers.map{ |tower| tower.discs.inspect.ljust(15) }.join
    names = towers.map{|t| t.name.ljust(15)}.join
    puts discs
    puts names
  end
  
end
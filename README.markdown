## Towers of Hanoi Simulator

* Clone
* Bundle
* Run the specs: `bundle exec rspec spec`

### Manual Usage

```
require './hanoi'

a     = Tower.new("A")
b     = Tower.new("B")
c     = Tower.new("C")
one   = Disc.new(1)
two   = Disc.new(2)
three = Disc.new(3)
four  = Disc.new(4)

[four, three, two, one].each do |disc|
  a.stack(disc)
end

Mover.move_from_a_to_b_via_c(a.size, a, c, b)
```

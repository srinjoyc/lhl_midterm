# Gives every user a whole bunch of False encounters...
# Theoretically, 10... But it seems to be alot more than that.
# Lol bugs.

e = User.all

e.each do |x|
  (1..10).each {|y| Encounter.create(attacker_id: y, defender_id: x.id, tier: "1", location: "Vancouver", active: false)}
end

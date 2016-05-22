#Encounters with no match

Encounter.create(defender_id: 1, tier: "1", location: "Vancouver")
Encounter.create(defender_id: 1, tier: "1", location: "Vancouver")
Encounter.create(defender_id: 1, tier: "1", location: "Vancouver")

#Encounters with match

Encounter.create(attacker_id: 2, defender_id: 1, tier: "1", location: "Vancouver", active: true)
Encounter.create(attacker_id: 3, defender_id: 1, tier: "1", location: "Vancouver", active: false)
Encounter.create(attacker_id: 4, defender_id: 1, tier: "1", location: "Vancouver", active: false)
Encounter.create(attacker_id: 5, defender_id: 1, tier: "1", location: "Vancouver", active: false)

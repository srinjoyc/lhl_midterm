class Encounter < ActiveRecord::Base
    belongs_to :attacker, class_name: "User"
    belongs_to :defender, class_name: "User"

    after_initialize :auto_active


# This doesn't seem to work.
# For now, the "active" column can be interpreted thusly:
#    nil - Unmatched encounter
#    true - Matched, active encounter
#    false - Matched, completed encounter

# This might actually solve some problems.
    def auto_active
      puts "My name is #auto_active from Encounter, and I don't do anything!"
      # if active == nil
      #   active = true
      # end # unless
    end


end #User

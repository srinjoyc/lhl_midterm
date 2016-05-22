class Encounter < ActiveRecord::Base
    belongs_to :attacker, class_name: "User"
    belongs_to :defender, class_name: "User"

    # after_initialize :auto_active
    #
    # def auto_active
    #   self[:active] ||= true
    # end


end #User

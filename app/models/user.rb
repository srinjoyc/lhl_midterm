require 'pry'
class User < ActiveRecord::Base

    has_many :encounters_as_attacker, foreign_key: "attacker_id", class_name: "Encounter"
    has_many :encounters_as_defender, foreign_key: "defender_id", class_name: "Encounter"
    validates :username, presence: true 
    validates :password, presence: true 
  
    def past_matches
      self.encounters_as_defender.where.not(attacker_id: self.id).order('id DESC').limit(5)
      # self.encounters_as_defender.where.not(attacker_id: self.id).order('id DESC').limit(5)
    end


    def total_matches 
        self.encounters_as_defender.count + self.encounters_as_attacker.count  
    end 
end 
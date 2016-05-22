require 'pry'
class User < ActiveRecord::Base

    has_many :encounters_as_attacker, foreign_key: "attacker_id", class_name: "Encounter"
    has_many :encounters_as_defender, foreign_key: "defender_id", class_name: "Encounter"
    validates :username, presence: true
    validates :password, presence: true
    after_initialize :init

    def init
      self.img_url ||= build_address #lets you set a default association
    end

    def past_matches
      self.encounters_as_defender.where.not(attacker_id: self.id).order('id DESC').limit(5)
    end


    def total_matches
        self.encounters_as_defender.count + self.encounters_as_attacker.count
    end

    def average_rating
        self.encounters_as_defender.average(d_review.to_i) + self.encounters_as_attacker.average(a_review.to_i)
    end

    def find_unmatched
      encounters_as_defender.where(attacker_id: nil)
    end # find_unmatched

    def find_active_defenses
      b.encounters_as_defender.where(active: true).where('attacker_id IS NOT NULL')
    end # find_active

    def find_active_attacks
      encounters_as_attacker.where(active: true)
    end #find_active_attacks

    def find_inactive_defenses
      b.encounters_as_defender.where(active: false)
    end

    def find_inactive_attacks
      b.encounters_as_attacker.where(active: false)
    end

end

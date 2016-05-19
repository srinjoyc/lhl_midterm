class User < ActiveRecord::Base

    has_many :encounters_as_attacker, foreign_key: "attacker_id", class_name: "Encounter"
    has_many :encounters_as_defender, foreign_key: "defender_id", class_name: "Encounter"
    validates :username, presence: true 
    validates :password, presence: true 
  

end 
helpers do

  def current_user
    @current_user ||= User.find(session[:current_user]) if session[:current_user]
  end # current_user

  def alert_switch
    if current_user

      # Current user has a match (actively defending)
      if current_user.find_active_defenses.count > 0
        {
          alertType: "alert-danger",
          icon: "fa fa-shield fa-5x",
          heading: "The game is afoot.",
          subheading: "You have been matched with a Cato; Remain always vigilant.",
          top_btn_href: "#",
          top_btn_text: "<p>Attack Complete</p><p><small>(Leave review)</small></p>",
          bottom_btn_href: "/shame",
          bottom_btn_text: "Cancel Attack"
        }

      # Current user is actively serving as Cato
      elsif  current_user.find_active_attacks.count > 0
        {
          alertType: "alert-success",
          icon: "fa fa-crosshairs fa-5x",
          heading: "Target Acquired.",
          subheading: "Happy hunting, Cato. Remember: To show mercy is to dishonor your charge.",
          top_btn_href: "#",
          top_btn_text: "<p>Attack Complete</p><p><small>(Leave review)</small></p>",
          bottom_btn_href: "/shame",
          bottom_btn_text: "Cancel Attack"
        }

      # Current user has requested but not matched
    elsif current_user.find_unmatched.count > 0
        {
          alertType: "well",
          icon: "fa fa-hourglass fa-5x",
          heading: "Request Received.",
          subheading: "Patience, grasshopper. You will be matched with a Cato when <strong>Fate</strong> wills it.",
          top_btn_href: "",
          top_btn_text: "",
          bottom_btn_href: "",
          bottom_btn_text: ""
        }

      # No active encounters
      else
        {
          alertType: "well",
          icon: "fa fa-question-circle fa-5x",
          heading: "You've No Encounters.",
          subheading: "Are you becoming complacent, grasshopper?",
          top_btn_href: "#request",
          top_btn_text: "<p>Request</p><p>a Cato</p>",
          bottom_btn_href: "/schedule",
          bottom_btn_text: "Serve as Cato"          
        }
      end #if
    end # if current user
  end #alert_switch

  def the_guy_who_you_are_attacking
    my_attack = current_user.find_active_attacks[0]
    User.find(my_attack.defender_id)
  end #the_guy_who_you_are_attacking

end # helpers

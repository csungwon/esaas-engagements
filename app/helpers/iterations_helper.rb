

module IterationsHelper
  def feedback_to_rating(field)
    if (field == "Strongly agree")
        return 5.0
    elsif (field == "Mostly agree")
        return 4.0
    elsif (field == "Neither agree nor disagree")
        return 3.0
    elsif (field == "Mostly disagree")
        return 2.0
    elsif (field == "Strongly disagree")
        return 1.0
    else
        return "No Data"
    end
  end
end
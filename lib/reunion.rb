class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    breakout_hash = Hash.new(0)
    @activities.each do |activity|
      amount_to_pay = activity.split
      activity.participants.each do |participant, amount_paid|
        breakout_hash[participant] += amount_to_pay - amount_paid
      end
    end
    breakout_hash
  end

  def summary
    breakout.map do |participant, amount|
      "#{participant}: #{amount}"
    end.join("\n")
  end

end

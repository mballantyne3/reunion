class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(participant_name, amount_paid)
    @participants[participant_name] = amount_paid
    @participants
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.keys.count
  end

  def owed
    amount_owed = {}
    @participants.map do |name, amount_paid|
      amount_owed[name] = split - amount_paid
    end
    amount_owed
  end

end

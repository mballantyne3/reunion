require './lib/activity'
require './lib/reunion'

RSpec.describe Reunion do
  let(:reunion) { Reunion.new("1406 BE") }
  let(:activity_1) { Activity.new("Brunch") }
  let(:activity_2) { Activity.new("Drinks") }

  it 'exists' do
    expect(reunion).to be_a(Reunion)
    expect(reunion.name).to eq("1406 BE")
  end

  it 'can return activities' do
    expect(reunion.activities).to eq([])

    reunion.add_activity(activity_1)

    expect(reunion.activities).to eq([activity_1])
  end

  it 'can add participants to activities and display cost' do
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)

    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    expect(reunion.total_cost).to eq(180)
  end

  it 'can return a breakout of participants and amount owed' do
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)

    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    expect(reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
  end

  it 'can return a summary of the breakout' do

    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)

    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    reunion.breakout

    expect(reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
  end
end

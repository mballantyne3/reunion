require './lib/activity'

RSpec.describe Activity do
  let(:activity) { Activity.new("Brunch") }

  it 'exists' do
    expect(activity).to be_a(Activity)
    expect(activity.name).to eq("Brunch")
  end

  it 'can have participants' do
    expect(activity.participants).to eq({})
  end

  it 'can add participants' do

    activity.add_participant("Maria", 20)

    expect(activity.participants).to eq({"Maria" => 20})
  end

  it 'can return total cost' do
    activity.add_participant("Maria", 20)

    expect(activity.total_cost).to eq(20)
  end

  it 'can return multiple guests and total cost' do
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    expect(activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    expect(activity.total_cost).to eq(60)
  end

  it 'can split the total cost' do

    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    expect(activity.split).to eq(30)
  end

  it 'can retuns amount owed' do
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    activity.split

    expect(activity.owed).to eq( {"Maria" => 10, "Luther" => -10} )
  end

end

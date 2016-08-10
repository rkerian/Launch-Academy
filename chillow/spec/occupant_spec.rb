require 'spec_helper'

describe Occupant do

  person_one = Occupant.new("Ryan", "Kerian")

  let(:ryan) { person_one }

  it "returns a first name" do
    expect(ryan.first).to eq('Ryan')
  end

  it "returns a last name" do
    expect(ryan.last).to eq('Kerian')
  end
end

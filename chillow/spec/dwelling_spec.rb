require 'spec_helper'

describe Dwelling do

  dwelling_one = Dwelling.new("2343 Carol Place",
    "Scotch Plains", "NJ", 07076)

  let(:childhood) { dwelling_one }

  it "returns an address string" do
    expect(childhood.address).to eq('2343 Carol Place')
  end

  it "returns a city" do
    expect(childhood.city_or_town).to eq('Scotch Plains')
  end

  it "returns a state" do
    expect(childhood.state).to eq('NJ')
  end

  it "returns a zipcode" do
    expect(childhood.zip_code).to eq(07076)
  end

end

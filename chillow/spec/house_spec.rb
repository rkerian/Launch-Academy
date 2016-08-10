require 'spec_helper'

describe House do

  house_one = House.new("2343 Carol Place",
    "Scotch Plains", "NJ", 07076, 200000)

  let(:childhood) { house_one }

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

  it "returns an asking price" do
    expect(childhood.asking_price).to eq(200000)
  end

end

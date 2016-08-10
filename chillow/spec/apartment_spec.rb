require 'spec_helper'

describe Apartment do

  apartment_one = Apartment.new("2343 Carol Place",
    "Scotch Plains", "NJ", 07076, 2000, "2016-01-01", "2016-12-31")

  ryan_k = Occupant.new('Ryan', 'Kerian')

  let(:childhood) { apartment_one }
  let(:ryan) { ryan_k }

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

  it "returns a rent price" do
    expect(childhood.rent).to eq(2000)
  end

  it "returns a lease start year" do
    expect(childhood.lease_start_date.year).to eq(2016)
  end

  it 'returns a lease start month' do
    expect(childhood.lease_start_date.day).to eq(1)
  end

  it 'returns a lease start day' do
    expect(childhood.lease_start_date.month).to eq (1)
  end

  it 'adds a roomate when apartment is not full' do
    childhood.add_item(ryan)
    expect(childhood.inventory.include?(ryan)).to eq(true)
  end

  it 'adds returns full when apartment is full' do
    childhood.add_item(ryan)
    childhood.add_item(ryan)
    childhood.add_item(ryan)
    childhood.add_item(ryan)
    expect(childhood.add_item(ryan)).to eq('full')
  end

  it 'removes a roommate when at least one resident' do
    childhood.add_item(ryan)
    expect(childhood.remove_item(ryan)).to eq('removed')
  end

  it 'returns empty when trying to remove roomie from empty apartment' do
    expect(childhood.remove_item(ryan)).to eq('removed')
  end
end

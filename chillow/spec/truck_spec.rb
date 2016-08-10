require 'spec_helper'

describe Truck do

  truck_one = Truck.new
  ryan_k = Occupant.new("Ryan", "Kerian")

  let(:truck) { truck_one }
  let(:ryan) { ryan_k }

  it "initializes an empty truck" do
    expect(truck.full?).to eq(false)
  end

  it "initializes a truck with a capacity of 10 boxes" do
    expect(truck.max_inventory).to eq(10)
  end

  it "adds Ryan's box" do
    truck.add_item(ryan)
    expect(truck.inventory.include?(ryan)).to eq(true)
  end

  it "removes Ryan's box" do
    truck.remove_item(ryan)
    expect(truck.inventory.include?(ryan)).to eq(false)
end

  it "unloads all of Ryan's boxes" do
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.empty(ryan)
    expect(truck.inventory.include?(ryan)).to eq(false)
  end

  it "does not add a box to a full truck" do
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.add_item(ryan)
    truck.add_item(ryan)
    expect(truck.add_item(ryan)).to eq("full")
  end
end

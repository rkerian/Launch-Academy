require "simplecov"
SimpleCov.start
require "pry"
require_relative "../code"

# YOUR TEST CODE HERE
describe "perimeter" do
  context "when testing perimeter of a square" do
    it "returns four times the length" do
      result = perimeter(4)
      expect(result).to eq(4 * 4)
    end
  end

  context "when testing a rectangle" do
    it "returns two times width plus two times height" do
      result = perimeter(2,6)
      expect(result).to eq(16)
    end
  end
end

describe "average" do
  it "returns the average grade from list" do
    result = average([90,85,90,60])
    expect(result).to eq(81.25)
  end
end

describe "rankings" do
  it "returns a ranked list of students" do
    result = rankings(["Billy", "Tina", "Bobby", "Jane"])
    expect(result).to eq("1. Billy\n2. Tina\n3. Bobby\n4. Jane\n")
  end
end

describe "greet" do
  context "spanish" do
    it "Hola Ryan! to std_out" do
      expect{ greet("Ryan","spanish") }.to output(/Hola Ryan!/).to_stdout
    end
  end

  context "english default" do
    it "Hi Ryan! to std_out" do
      expect{ greet("Ryan") }.to output(/Hi Ryan!/).to_stdout
    end
  end

  context "italian" do
    it "Ciao Ryan! to std_out" do
      expect{ greet("Ryan","italian") }.to output(/Ciao Ryan!/).to_stdout
    end
  end

  context "french" do
    it "Bonjour Ryan! to std_out" do
      expect{ greet("Ryan","french") }.to output(/Bonjour Ryan!/).to_stdout
    end
  end
end

describe "print_puzzle" do
  context "no guesses" do
    it "prints _ _ _ _ _ _" do
      expect{ print_puzzle('donkey') }.to output(/_ _ _ _ _ _/).to_stdout
    end
  end

  context "optional argument includes d, n and y" do
    it "it should print d _ n _ _ y" do
      expect{ print_puzzle('donkey', ["d", "n", "y"]) }.to output(/d _ n _ _ y/).to_stdout
    end
  end
end

describe "divisible_by_three" do
  context "number not divisible by three" do
    it "returns false" do
      result = divisible_by_three(4)
      expect(result).to eq(false)
    end
  end

  context "number divisible by three" do
    it "returns true" do
      result = divisible_by_three(3)
      expect(result).to eq(true)
    end
  end
end

describe "perfect_square?" do
  context "when testing number less than 1" do
    it "raises an argument error" do
      expect{ perfect_square?(0) }.to raise_error(ArgumentError)
    end
  end

  context "when testing the number 36, which has a perfect square" do
    it "returns true" do
      result = perfect_square?(36)
      expect(result).to eq(true)
    end
  end

  context "when testing the number 7, which does not have a perfect square" do
    it "returns false" do
      result = perfect_square?(7)
      expect(result).to eq(false)
    end
  end
end

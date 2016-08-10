require_relative "../code"

describe "plus_two" do
  it "should add plus two to the given number" do
    result = plus_two(0)
    expect(result).to eq(2)
  end
end

describe "subtract_or_multiply_by_two" do
  it "should subtract two if given a negative number" do
    result = subtract_or_multiply_by_two(-3)
    expect(result).to eq(-5)
  end

  it "should multiply by two if given zero" do
    result = subtract_or_multiply_by_two(0)
    expect(result).to eq(0)
  end

  it "should multiply by two if given a positive number" do
    result = subtract_or_multiply_by_two(4)
    expect(result).to eq(8)
  end
end

describe "repeat_last_word" do
  it "repeats the last word of a sentence" do
    new_sentence = repeat_last_word("hi dad")
    expect(new_sentence).to eq("hi dad dad")
  end
end

describe "give_example" do
  it "should return a String if given 'string'" do
    example = give_example("string")
    expect(example).to be_a(String)
  end

  it "should return a Fixnum if given 'fixnum'" do
    example = give_example("fixnum")
    expect(example).to be_a(Fixnum)
  end

  it "should return a default message for everything else" do
    example = give_example("not a ruby class")
    expect(example).to eq("input does not match any Ruby class")
  end
end

describe "output_to_terminal" do
  it "should output 'Hello World' to the terminal" do
    expect{ output_to_terminal }.to output(/Hello World/).to_stdout
  end
end

describe "raise_standard_error" do
  it "should raise a StandardError" do
    expect{ raise_standard_error }.to raise_error(StandardError)
  end
end

describe "add_five_and_ten" do
  it "should append the numbers five and ten to the given array" do
    new_array = add_five_and_ten([1, 6])
    expect(new_array).to include(5, 10)
  end
end

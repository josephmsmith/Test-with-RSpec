require 'car'

describe 'Car' do
  describe 'attributes' do
    it "allows reading and writing for :make" do
      car = Car.new
      car.make = 'Test'
      expect(car.make).to eq('Test')
    end

    it "allows reading and writing for :year" do
      car = Car.new
      car.year = 9999
      expect(car.year).to eq(9999)
    end

    it "allows reading and writing for :color" do
      car = Car.new
      car.color = "Blue"
      expect(car.color).to eq("Blue")
    end

    it "allows reading for wheels" do
      car = Car.new
      expect(car.wheels).to eq(4)
    end

    it 'allows writing for :doors' do
      car = Car.new
      car.doors = 4
      expect(car.instance_variable_get(:@doors)).to eq(4)
    end
  end
  # class methods use .method
  describe '.colors' do
    it "returns an array of color names" do
      c = ['blue','black','red','green']
      expect(Car.colors).to match_array(c)
    end
  end
  # instance methods use #method
  describe '#full_name' do
    it 'returns a string in the expected format' do
      @honda = Car.new(:make => 'Honda', :year => 2020, :color => 'Blue')
      expect(@honda.full_name).to eq("2020 Honda (Blue)")
    end
    
    context 'when initialized with no argument' do 
      it 'returns a string without using default values' do
        car = Car.new
        expect(car.full_name).to eq('2007 Volvo (unknown)')
      end
    end
  end
end
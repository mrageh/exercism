class Squares
  def initialize(number)
    @number = number
  end

  def square_of_sums
    (1..number).inject(:+) ** 2
  end

  def sum_of_squares
    (1..number).inject(0) { |sum, value| sum += (value ** 2) }
  end

  def difference
    square_of_sums - sum_of_squares
  end

  private

  attr_reader :number
end

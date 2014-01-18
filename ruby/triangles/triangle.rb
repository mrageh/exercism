
class TriangleError < StandardError; end

class Triangle
  attr_reader :sides


  def initialize(hyp, opp, adj)
    @sides = [hyp, opp, adj]
    illegal
  end

  def illegal
    if @sides.any? {|side| side <= 0}
      raise TriangleError.new
    end
  end

  def kind
    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    elsif scalene?
      :scalene
    end
  end

  def equilateral?
    @sides.all? { |side| side == @sides[0] }
  end

  def isosceles?
    @sides.uniq.count == 2
  end

  def scalene?
    @sides.uniq.count == 3
  end
end

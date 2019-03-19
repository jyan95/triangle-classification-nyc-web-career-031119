class Triangle
  attr_accessor :side1, :side2, :side3, :equilateral,:isosceles,:scalene

  def initialize(s1,s2,s3)
    if s1 >= (s2 + s3) || s2 >= (s1 + s3) || s3 >= (s1 + s2)
      raise TriangleError
    end

    if s1 <= 0 || s2 <= 0 ||s3 <= 0
      raise TriangleError
    end

    if s1 == nil || s2 == nil ||s3 == nil
      raise TriangleError
    end
    @s1 = s1
    @s2 = s2
    @s3 = s3
    @sides = []
    @sides << s1
    @sides << s2
    @sides << s3
  end

  def valid?
    sum1 = @sides[0] + @sides[1]
    sum2 = @sides[0] + @sides[2]
    sum3 = @sides[1] + @sides[2]

    if @sides.include?(0) || @sides.reduce(:+) <= 0
      raise TriangleError
    else (@sides.none?{|side| side <= 0}) && sum1 > @s3 && sum2 > @s2 && sum3 > @s1
      true
    end
  end

  def kind
    if valid?
      if @sides.uniq.length == 1
        :equilateral
      elsif @sides.uniq.length == 2
        :isosceles
      else
        :scalene
      end
    else
      raise Triangle
    end
  end
end

class TriangleError < StandardError
  def message
    "This is not a valid triangle."
  end
end

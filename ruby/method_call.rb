if ARGV[0]
  puts __LINE__
  def expression(expr, x, y)
    case expr
    when '*'
      x * y
    when '/'
      x / y
    when '-'
      x - y
    else
      x + y
    end
  end
else
  puts __LINE__
  @inner_expr = lambda {|x, y|
    x + y
  }
  def expression(expr, x, y)
    @inner_expr.call(x, y)
  end
end

expr = '+'
case expr
when '*'
  @inner_expr = lambda {|x, y|
    x * y
  }
when '/'
  @inner_expr = lambda {|x, y|
    x / y
  }
when '-'
  @inner_expr = lambda {|x, y|
    x - y
  }
else
end
1.upto 10000000 do |i|
  z = expression(expr, i, i + 1)
end

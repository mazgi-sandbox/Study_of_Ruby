class Formatter
  def initialize
    puts "init:#{self}"
  end
  def format(str)
    puts "format:#{self}"
    '<format>' + str + '</format>'
  end
end

a = Formatter.new
p a.format 'hoe'

Formatter.class_eval do
  def format_wrapper(str)
    '<wrap>' + format_orig(str) + '</wrap>'
  end
  alias_method :format_orig, :format
  alias_method :format, :format_wrapper
end

p a.format 'hoe'
b = Formatter.new
p b.format 'hoe'

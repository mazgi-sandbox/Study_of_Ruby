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
    if respond_to?(:obj_format_wrapper)
      obj_format_wrapper str
    else
      '<wrap>' + format_orig(str) + '</wrap>'
    end
  end
  alias_method :format_orig, :format
  alias_method :format, :format_wrapper
end

p a.format 'aaa'
b = Formatter.new
p b.format 'bbb'
c = Formatter.new
c.instance_eval do
  def obj_format_wrapper(str)
    '<obj_wrap>' + format_orig(str) + '</obj_wrap>'
  end
end
p c.format 'ccc'

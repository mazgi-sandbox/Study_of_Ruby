# -*- coding: utf-8 -*-
# 例外の投げ直し

begin
  begin
    raise RuntimeError, 'err'
  rescue RuntimeError => e
    puts "#{__LINE__}:#{e.message}"
    raise e
  end
rescue => e
  puts "#{__LINE__}:#{e.message}"
end

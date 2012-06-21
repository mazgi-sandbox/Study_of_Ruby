# -*- encoding: utf-8 -*-

require 'pp'

EVENT_SOURCE='event_source/**/*'

paths=Dir::glob(EVENT_SOURCE).map{|path|
  case File::ftype(path)
  when 'directory'
    path
  else
    File::dirname(path)
  end
}

paths.uniq!
paths.sort!{|a,b|a.size<=>b.size}
paths.each{|path|
  puts path
}


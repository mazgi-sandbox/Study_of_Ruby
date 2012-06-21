# -*- encoding: utf-8 -*-

require 'pp'

EVENT_SOURCE='event_source/**/*'
#EVENT_SOURCE='/var/**/tmp'

base_dir=EVENT_SOURCE
while true
  break unless base_dir.index('*')
  base_dir=File::dirname(base_dir)
end
puts "basedir:#{base_dir}"

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
  puts "subdirs:#{path}"
}


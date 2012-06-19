# -*- encoding: utf-8 -*-

require "rb-inotify"
#require "ruby-inotify"

require 'pp'

EVENT_SOURCE='event_source/**/*'

Dir::glob(EVENT_SOURCE).each {|f|
  pp f
}


notifier = INotify::Notifier.new
#notifier.watch("path/to/foo.txt", :modify) {puts "foo.txt was modified!"}
notifier.watch("event_source", :all_events) do |event|
  #pp event
  puts event.name
  puts event.watcher.path
  puts "#{event.name} is now in #{EVENT_SOURCE}."
end
notifier.run


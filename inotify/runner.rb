# -*- encoding: utf-8 -*-

require "rb-inotify"
#require "ruby-inotify"

require 'pp'

EVENT_SOURCE='event_source/**/*'

class Watcher
  def initialize(path='')
    @path=path
    @files=[]
    @running=false
  end

  def start
    puts "watch start with #{@path}"
    @running=true
    Dir::glob(@path).each {|f|
      @files.push f
    }
    @thread = Thread.new do
      counter=0
      while @running
        if counter%60==0
          puts '<<<begin thread block>>>'
          puts "watching ... #{@path}"
          puts "#{@files.join(",\n")}"
          puts '<<<end thread block>>>'
	end
	counter+=1
        sleep 1
      end
    end
    @thread.run
  end

  def stop
    @running=false
    @thread.join
    @files.clear
    puts "watch stop with #{@path}"
  end
end

w = Watcher.new(EVENT_SOURCE)
w.start

notifier = INotify::Notifier.new
#pp notifier.methods
#notifier.watch("path/to/foo.txt", :modify) {puts "foo.txt was modified!"}
notifier.watch("event_source", :recursive, :create, :delete, :attrib) do |event|
  puts '<<<begin inotify event block>>>'
  p Time.now

  #pp event
  puts "event.name:#{event.name}"
  puts "event.watcher.path:#{event.watcher.path}"
  #puts "#{event.name} is now in #{EVENT_SOURCE}."

  w.stop
  w.start

  puts '<<<end inotify event block>>>'
end

notifier.run


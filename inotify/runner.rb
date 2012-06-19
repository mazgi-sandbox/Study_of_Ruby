# -*- encoding: utf-8 -*-

require 'pp'

Dir::glob("event_source/**/*").each {|f|
  pp f
}

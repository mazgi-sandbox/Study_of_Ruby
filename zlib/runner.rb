# -*- encoding: utf-8 -*-

require "zlib"
require 'pp'

srand(1)
str = (1..500).collect{
  ['A', 'T', 'C', 'G'].at(rand(4))
}.join

p str.size #=> 500

[ Zlib::NO_COMPRESSION,
Zlib::BEST_SPEED,
Zlib::BEST_COMPRESSION,
Zlib::DEFAULT_COMPRESSION ].each { |level|
  deflate_str = Zlib::Deflate.deflate(str, level)
  p deflate_str.size
# 展開する場合は、下記を実行する
#   #puts Zlib::Inflate.inflate(str)
}

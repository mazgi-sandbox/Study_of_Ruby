require 'openssl'

data = 'data'
pass = 'pass'
salt = 'salt'

data = "Very, very confidential data"

cipher = OpenSSL::Cipher::AES.new(128, :CBC)
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv

encrypted = cipher.update(data) + cipher.final

decipher = OpenSSL::Cipher::AES.new(128, :CBC)
decipher.decrypt
decipher.key = key
iv = cipher.random_iv
decipher.iv = iv

plain = decipher.update(encrypted) + decipher.final

puts "data: #{data.dump}"
puts "encrypted: #{encrypted.dump}"
puts "plain: #{plain.dump}"
puts data == plain

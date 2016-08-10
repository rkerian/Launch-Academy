require "uri"
require "openssl"

def decode_session(str)
  Marshal.load(URI.decode_www_form_component(str).unpack("m").first)
end

session_id = decode_session("BAh7CEkiD3Nlc3Npb25faWQGOgZFVEkiRWYxYWE0ZjY1MDA3Nzk3OTIxNWQ3%0AMDJiYWVlYWUyZGRiODJkYzA5Y2ZhNjEyYjU3ZDEzMTM0ZTY4ZTcwNGM3ZTcG%0AOwBGSSIKaHVtYW4GOwBGaQdJIgt3aW5uZXIGOwBGSSIKaHVtYW4GOwBU%0A--f65f378b1306d731a7b5fb365dd6ca9cf0181543").to_s
secret = "nobody_will_ever_find_me"
puts "My Session ID"
puts session_id

def generate_hmac(data, secret)
  OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, secret, data)
end

my_hmac = generate_hmac(session_id, secret)
puts "My HMAC"
puts my_hmac

#I edited and locked the cookie with the following key:
#BAh7CEkiD3Nlc3Npb25faWQGOgZFVEkiRWYxYWE0ZjY1MDA3Nzk3OTIxNWQ3%0AMDJiYWVlYWUyZGRiODJkYzA5Y2ZhNjEyYjU3ZDEzMTM0ZTY4ZTcwNGM3ZTcG%0AOwBGSSIKaHVtYW4GOwBGaQdJIgt3aW5uZXIGOwBGSSIKaHVtYW4GOwBU%0A--f65f378b1306d731a7b5fb365dd6ca9cf0181543

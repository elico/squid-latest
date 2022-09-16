#!/usr/bin/env ruby

require "json"

lines = File.open(ARGV[0]).readlines

url = ARGV[1]

latest = {}

latest["url"] = url

lines.each do |l|

	case l
	when /^File\:\ ([a-z\-\.0-9]+)$/
		latest["file"] = $1
	when /^Date\: ([\ 0-9\:a-zA-Z]+)$/
		latest["date"] = $1
	when /^Size\: ([0-9]+)$/
		latest["size"] = $1.to_i
	when /^MD5\ \: ([a-z0-9]+)$/
		latest["MD5"] = $1
	when /^SHA1\: ([a-z0-9A-Z]+)$/
		latest["SHA1"] = $1
	else

	end
end

puts(JSON.pretty_generate(latest))

#!/usr/bin/env ruby

require 'json'

visits = Hash.new
f = File.open("visits.csv")
f.each { |l|
    v = l.chomp.split(/,/)
    visits[v[1]] = v[0].to_i
}

data = JSON.parse(STDIN.read)

data["features"].each { |f|
    if visits.has_key?(f["properties"]["name"])
        f["properties"]["visits"] = visits[f["properties"]["name"]]
    end
}

puts data.to_json

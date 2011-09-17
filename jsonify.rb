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
    if visits.has_key?(f["p"]["n"])
        f["p"]["v"] = visits[f["p"]["n"]]
    end
}

puts data.to_json

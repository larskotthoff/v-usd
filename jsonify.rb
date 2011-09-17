#!/usr/bin/env ruby

require 'json'

visits70 = Hash.new
f = File.open("sources-70-binned.csv")
f.each { |l|
    v = l.chomp.split(/,/)
    visits70[v[1]] = v[0].to_i
}
visits80 = Hash.new
f = File.open("sources-80-binned.csv")
f.each { |l|
    v = l.chomp.split(/,/)
    visits80[v[1]] = v[0].to_i
}
visits90 = Hash.new
f = File.open("sources-90-binned.csv")
f.each { |l|
    v = l.chomp.split(/,/)
    visits90[v[1]] = v[0].to_i
}
visits00 = Hash.new
f = File.open("sources-00-binned.csv")
f.each { |l|
    v = l.chomp.split(/,/)
    visits00[v[1]] = v[0].to_i
}

data = JSON.parse(STDIN.read)

data["features"].each { |f|
    f["p"].delete("c")
    if visits70.has_key?(f["p"]["n"])
        f["p"]["70"] = visits70[f["p"]["n"]]
    else
        f["p"]["70"] = 0
    end
    if visits80.has_key?(f["p"]["n"])
        f["p"]["80"] = visits80[f["p"]["n"]]
    else
        f["p"]["80"] = 0
    end
    if visits90.has_key?(f["p"]["n"])
        f["p"]["90"] = visits90[f["p"]["n"]]
    else
        f["p"]["90"] = 0
    end
    if visits00.has_key?(f["p"]["n"])
        f["p"]["00"] = visits00[f["p"]["n"]]
    else
        f["p"]["00"] = 0
    end
}

puts data.to_json

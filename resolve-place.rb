#!/usr/bin/env ruby

def convert(s)
    g = s.scan(/([NSWE]) ([0-9]+)° ([0-9]+)' ([0-9]+)''/)
    v = g[0][1].to_f + (g[0][2].to_f + (g[0][3].to_f / 60)) / 60
    if g[0][0] == "N" or g[0][0] == "E"
        return v
    else
        return -v
    end
end

while gets
    q = $_.chomp.sub(" ", "%20")
    f = %x[IFS=","; GET "http://www.geonames.org/search.html?q=#{q}&featureClass=P" | grep nowrap | head -n 1 ]
    cs = f.scan(/>([^<>]+)</)
    puts [$_.chomp, convert(cs[0][0]).to_s, convert(cs[1][0]).to_s].join(",")
end

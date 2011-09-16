#!/usr/bin/env ruby

tbody = false
td = 0
years = []
country = ""
while gets
    if $_ =~ /<tbody>/
        tbody = true
    elsif $_ =~ /<\/tbody>/
        tbody = false
    elsif tbody
        if $_ =~ /<\/tr>/
            td = 0
            years.each { |y|
                puts y + "," + country
            }
        elsif
            p = $_.scan(/<td>(.+?)(<\/td>|$)/)
            unless p[0].nil?
                td += 1
                if td == 2
                    country = p[0][0]
                elsif td == 4
                    years = p[0][0].scan(/[0-9]{4}/)
                end
            end
        end
    end
end

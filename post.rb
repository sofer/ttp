#!/usr/bin/ruby

path = '_posts/'

if ARGV[3] and ARGV[0] =~ /\d\d\d\d-\d\d-\d\d/
  date, title, cat, author, top = ARGV 
  top ||= false
  file = path + date+'-'+title.gsub(' ', '-').downcase.gsub(/[^a-z-]/, '') + '.textile'
  outline = <<OUTLINE
---
layout: post
top: #{top}
title: #{title}
author: #{author}
categories: #{cat}
tags: [] 
summary: "" 
---

OUTLINE
  File.open(file, 'w') do |f|
    f.write(outline)
  end
  puts "writen #{file}"

else
  puts <<USAGE
Usage: /post.rb arg1 "arg2" arg3 "arg4" arg5
arg1: date in YYYY-MM-DD format
arg2: title
arg3: category
arg4: author
arg5: top T or F
USAGE
end

__END__

As part of their Spring Film Season, Transition Kentish Town are showing _The Farmer and the Horse_ at Annie's Bar. 

It's a fascinating immersion into the world of three young people trying to get into agriculture who have fallen in love with working with horses. A vision of how farming might be in a lower-energy world.

All film showings are in the downstairs room at Annie's Bar, 180 Kentish Town Road, NW5 2AE.

These are relaxed occasions and they usually have a friendly discussion afterwards. A &pound;2 donation is requested.

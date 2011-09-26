#!/usr/bin/ruby

path = '_posts/'

if ARGV[3] and ARGV[0] =~ /\d\d\d\d-\d\d-\d\d/
  date, title, cat, author, top = ARGV 
  top ||= false
  kind = (['social','energy','growing'].include? cat) ? cat : 'home'
  file = path + date+'-'+title.gsub(' ', '-').downcase.gsub(/[^a-z-]/, '') + '.textile'
  outline = <<OUTLINE
---
layout: post
top: #{top}
title: #{title}
author: #{author}
kind: #{kind}
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
arg3: category (social, energy, growing, information, announcements)
arg4: author
arg5: leave blank if not a top story
USAGE
end

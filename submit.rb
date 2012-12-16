#!/usr/bin/ruby

ARGV[0] = '2012-12-13'

path = '_posts/'
if ARGV[0] =~ /\d\d\d\d-\d\d-\d\d/
  date = ARGV[0]
  file = ARGV[1] || 'submit.txt'
  content = ''
  text = File.open(file, 'r').each_line do |line|
    content += line
  end
  cols = content.split("\t")
  title = cols[1]
  file = path + date+'-'+title.gsub(' ', '-').downcase.gsub(/[^a-z-]/, '') + '.textile'
  categories = "#{cols[7]}"
  copy = cols[3].start_with?('"') ? cols[3][1..-2] : cols[3]
  copy.gsub!('""', '"')
  endnote = ''
  if cols[13] != /yes/i
    categories += ", events"
    endnote += "*DATE*\n#{cols[5]}\n\n*TIME*\n#{cols[8]}\n\n*VENUE*\n#{cols[9]}, #{cols[10]}\n\n"
  end
  if cols[12] != /\w/
    endnote += "\"Website\":#{cols[12]}. "
  end
  if cols[11] != /\w/
    endnote += "\"Contact\":mailto:#{cols[11]}. "
  end

    outline = <<OUTLINE
---
layout: post
top: 
title: #{title}
author: #{cols[4]}
kind: home
categories: [#{categories}, news]
tags: [] 
summary: "#{cols[2]}"
---
#{copy}

#{endnote}

OUTLINE

    File.open(file, 'w') do |f|
      f.write(outline)
    end
    puts "written #{file}"




else
  puts <<USAGE
Usage: /submit.rb arg1 arg2
arg1: date in YYYY-MM-DD format
arg2: submission file (submit.rb by default)
USAGE

end



__END__




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
  puts "written #{file}"

else
  puts <<USAGE
Usage: /post.rb arg1 "arg2" arg3 "arg4" arg5
arg1: date in YYYY-MM-DD format
arg2: title
arg3: category (social, energy, growing, information, announcements)
arg4: author
arg5: leave blank if not a top story
(also 'social', 'energy' and 'growing' categories have their own 'kind' of background)
USAGE
end

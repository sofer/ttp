require 'net/http'
$domain = 'posterous.com'
$path = '/api/2/sites/transitiontufnellpark/posts/public'
$response = Net::HTTP.start($domain) do |http|
  http.get $path
end
$posts = $response.body

$target = 'posts.json'
$f = File.new($target, 'w')
$f.puts $posts
$f.close

$posts.each do |p|
  puts p
end


puts "written to #{$target}, apparently"
# 20.times do |story|
#   Story.create(title: "#{story}", link: "https://blog.openai.com/unsupervised-sentiment-neuron/", email: "thisisfake@fakeemail.com")
# end

require 'open-uri'
require 'nokogiri'

(1..10).each do |page|
  Nokogiri::HTML(open("https://news.ycombinator.com?p=#{page}")).css(".storylink").each { |article| Story.create(title: article.content, link: article.values.first, email: 'thisfakemail@fake.com') }
end

# still need numbers.

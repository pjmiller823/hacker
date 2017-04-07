# 20.times do |story|
#   Story.create(title: "#{story}", link: "https://blog.openai.com/unsupervised-sentiment-neuron/", email: "thisisfake@fakeemail.com")
# end

require 'open-uri'
require 'nokogiri'
Nokogiri::HTML(open('https://news.ycombinator.com')).css(".storylink").each { |article| Story.create(title: article.content, link: article.values.first, email: 'thisfakemail@fake.com') }

# add on an orderby to the end?
# still need numbers.

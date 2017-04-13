# 20.times do |story|
#   Story.create(title: "#{story}", link: "https://blog.openai.com/unsupervised-sentiment-neuron/", email: "thisisfake@fakeemail.com")
# end

require 'open-uri'
require 'nokogiri'

user_1 = User.create(name: "Patrick Miller", email: "pjmiller823@gmail.com", password: "password", password_confirmation: "password")
user_2 = User.create(name: "Bruno", email: "thisisfake@fake.com", password: "password", password_confirmation: "password")
(1..10).each do |page|
  Nokogiri::HTML(open("https://news.ycombinator.com?p=#{page}")).css(".storylink").each_with_index { |article, index| Story.create(title: article.content, link: article.values.first, created_by: index.odd? ? user_1 : user_2) }
end
page = Nokogiri::HTML(open("@story.link"))
image_from_the_page = page.css("img").select.first
helper_method :image_from_the_page
# still need numbers.

require 'open-uri'
require 'pry'
require_relative './student.rb'

class Scraper

  def self.scrape_index_page(index_url)
    index_url = open('./fixtures/student-site/index.html')
    doc =  Nokogiri::HTML(index_url)
    students_array = []
    student = {}
    doc.css(".roster-card-container .student-card").each do |s|
      student[:name] = s.css("h4").text
      student[:location] = s.css("p").text
      student[:profile_url] = s.css("a").attribute("href").value
      students_array << student
    end
    students_array
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    profile = {}
    .css(".social-icon-container a").map { |i| i.attribute('href').value }
      profile = {
        :twitter => page.find { |i| i.include?("twitter") },
        :linkedin => page.find { |i| i.include?("linkedin") },
        :github => page.find { |i| i.include?("github") },
        :blog => page.find { |i| !i.include?("twitter") && !i.include?("github") && !i.include?("linkedin") },
        profile[:profile_quote] = doc.css(".profile_quote").text
        profile[:bio] => doc.css(".description-holder").css("p").text
      }

  end
end

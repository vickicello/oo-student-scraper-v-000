require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :name, :location, :profile_url

  def self.scrape_index_page(index_url)
    index_url = open('./fixtures/student-site/index.html')
    doc =  Nokogiri::HTML(index_url)
    students_array = []
    student = {}
    doc.css(".roster-card-container .student-card").each do |s|
      student[:name] = s.css("h4").text
      student[:location] = s.css("p").text
      student[:profile_url] = s.css("a").attribute("href").value
    end
      students_array.push(student)
    end
    students_array
  end

  def self.scrape_profile_page(profile_url)
    profile = {}
    page = Nokogiri::HTML(open(profile_url)).css(".social-icon-container a").map { |i| i.attribute('href').value }
      profile = {
        :twitter => page.find { |i| i.include?("twitter") },
        :linkedin => page.find { |i| i.include?("linkedin") },
        :github => page.find { |i| i.include?("github") },
        :blog => page.find { |i| !i.include?("twitter") && !i.include?("github") && !i.include?("linkedin") },
        :profile_quote => Nokogiri::HTML(open(profile_url)).css("div.profile_quote").text,
        :bio => Nokogiri::HTML(open(profile_url)).css(".description-holder").css("p").text
      }

  end
end

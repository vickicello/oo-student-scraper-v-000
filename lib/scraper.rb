require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper

  def self.scrape_index_page(index_url)
    index_url = open('./fixtures/student-site/index.html')
    doc =  Nokogiri::HTML(index_url)
    students_array = []
    student = {}
    doc.css(".roster-card-container .student-card").each do |s|
      student[:name] = s.css("h4").text
      student[:location] = s.css("p.student-location").text
      student[:profile_url] = s.css("a").attribute("href").value
      students_array << student
    end
    students_array
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    profile = {}
    profile[:profile_quote] = doc.css(".profile-quote").text
    profile[:bio] = doc.css(".description-holder p").text
    links = doc.css(".social-icon-container").css("a")
    links.map do |l|
      if l['href'].include?("twitter")
        profile[:twitter] = l['href']
      elsif l['href'].include?("linkedin")
        profile[:linkedin] = l['href']
      elsif l['href'].include?("github")
        profile[:github] = l['href']
      elsif l['href'].include?(".com")
        profile[:blog] = l['href']
      end
    end
      profile
    end
end

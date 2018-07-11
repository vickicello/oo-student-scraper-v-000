require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :name, :location, :profile_url

  def self.scrape_index_page(index_url)
    students_array = []
    student = {}
    Nokogiri::HTML(open(index_url)).css(".roster-card-container .student-card").each do |s|
      students = {
        :name => s.css("h4").text,
        :location => s.css("p").text,
        :profile_url => s.css("a").text
      }
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
        :profile_quote => Nokogiri::HTML(open(profile_url)).css("div.profile_quote").text
        :bio => Nokogiri::HTML(open(profile_url)).css(".description-holder").css("p").text
      }
      profile.delete_if {|key, value| value == nil}
  end

end

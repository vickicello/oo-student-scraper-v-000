require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :name, :location, :profile_url

  def self.scrape_index_page(index_url)
    student_array = []
    student = {}
    Nokogiri::HTML(open(index_url)).css(".roster-card-container .student-card").each do |s|
      students = {
        :name => s.css("h4").text,
        :location => s.css("p").text,
        :profile_url => s.css("a").text
      }
      student_array.push(student)
    end
    student_array
  end

  def self.scrape_profile_page(profile_url)
    # profile_url =
    # return value - hash in which the key/value pairs describe an individual student.
    # Some students don't have a twitter/other social link. account for that
    # attributes to scrape : twitter url, linkedin url, github url,
    # blog url, profile quote, and bio.
    # ex: => {:twitter=>"http://twitter.com/flatironschool",
    #   :linkedin=>"https://www.linkedin.com/in/flatironschool",
    #   :github=>"https://github.com/learn-co",
    #   :blog=>"http://flatironschool.com",
    #   :profile_quote=>"\"Be notorious.\" - Rumi",
    #   :bio=> "I'm a school"
    #  }

  end

end

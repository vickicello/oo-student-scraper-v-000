require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :name, :location, :profile_url

  def self.scrape_index_page(index_url)
    index_url = "./fixtures/student-site/index.html"
    #  use Nokogiri and Open-URI to access that page.
    #  return value is array of hashes - each hash represents a single student.
    #  The keys of the individual student hashes should be :name, :location and :profile_url.

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

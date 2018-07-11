class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  # Student class shouldn't directly interact with the Scraper class––
  # it shouldn't call on the Scraper class in any of its methods or take
  # in the Scraper class itself as an argument.
  

  def initialize(student_hash)

  end

  def self.create_from_collection(students_array)

  end

  def add_student_attributes(attributes_hash)

  end

  def self.all

  end
end

class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  # Student class shouldn't directly interact with the Scraper class––
  # it shouldn't call on the Scraper class in any of its methods or take
  # in the Scraper class itself as an argument.


  def initialize(student_hash)
    # use metaprogramming to assign the newly created student
    # attributes and values in accordance with the key/value pairs of the hash.
    #  Use the #send method to acheive this.
    # This method should also add the newly created student to the
    # Student class' @@all array of all students.
    @@all << self

  end

  def self.create_from_collection(students_array)
    # method should take in an array of hashes.
    # we will call Student.create_from_collection with the
    # return value of the Scraper.scrape_index_page method
    # as the argument. The #create_from_collection method
    # should iterate over the array of hashes and
    # create a new individual student using each hash
  end

  def add_student_attributes(attributes_hash)
    # instance method takes in a hash whose key/value pairs describe
    # additional attributes of an individual student.
    # call student.add_student_attributes with the return value of the
    # Scraper.scrape_profile_page method as the argument.
    # It should iterate over the given hash and use metaprogramming to
    # dynamically assign the student attributes and values in accordance
    # with the key/value pairs of the hash. Use the #send method to achieve this.
# The return value of this method should be the student itself. Use the self keyword
  end

  def self.all
    @@all
  end
end

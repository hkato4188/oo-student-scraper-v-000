require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    
    index_page = Nokogiri::HTML(open(index_url))
    roster = []
    student_data = index_page.css("div.roster-cards-container .student-card a")
    student_data.each do |student|
        student_profile_url = student.attribute("href").value
        student_name = student.css("div.card-text-container .student-name").children.text
        student_location = student.css("div.card-text-container .student-location").children.text
          roster << {name: student_name, location: student_location, profile_url: student_profile_url}
    end
    roster
  end

  def self.scrape_profile_page(profile_url)
    binding.pry
    #returns hash where key/value pairs describe individual student
    profile_page = Nokogiri::HTML(open(profile_url))
    profile_page.css("div.social-icon-container a").map do |info|
      info.include?("twitter")? 
  end

end


# if attributes
#       attributes.each do |key, value|
#         self.send("#{key}=", value)
#       end
#     end
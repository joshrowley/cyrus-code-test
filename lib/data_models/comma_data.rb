require 'csv'

class CommaData
  attr_reader :raw_data

  def initialize(raw_data)
    @raw_data = raw_data
  end

  def parse
    parsed_data = []
    CSV.parse(raw_data) do |row|
      hash = {}
      hash[:last_name] = row[0].strip
      hash[:first_name] = row[1].strip
      hash[:gender] = row[2].strip
      hash[:fav_color] = row[3].strip
      hash[:dob] = row[4].strip
      parsed_data << hash
    end
    parsed_data
  end

end
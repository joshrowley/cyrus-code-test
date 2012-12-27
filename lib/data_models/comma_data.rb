require 'csv'

class CommaData
  attr_reader :raw_data

  def initialize(raw_data)
    @raw_data = raw_data
  end

  def parse_record_params
    CSV.parse(raw_data).inject([]) do |array, row|
      row = row.collect { |elem| elem.strip }
      array << {  :last_name => row[0],
                  :first_name => row[1],
                  :gender => row[2],
                  :fav_color => row[3],
                  :dob => row[4]  }
    end
  end

end
class PipeData
  attr_reader :raw_data

  def initialize(raw_data)
    @raw_data = raw_data
  end

  def parse
    parsed_data.inject([]) do |array, row|
    array << {  :last_name => row[0],
                :first_name => row[1],
                :middle_initial => row[2],
                :gender => row[3],
                :fav_color => row[4],
                :dob => row[5]  }
    end
  end

  private
    def parsed_data
      raw_data.lines.collect do |line|
        line.split("|").collect { |elem| elem.strip }
      end
    end

end
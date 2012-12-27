class PipeData
  attr_reader :raw_data

  def initialize(file_path)
    @raw_data = File.open(file_path).read
  end

  def parse_record_params
    build_record_params_hash(parsed_data)
  end

  private
    def parsed_data
      raw_data.lines.collect do |line|
        line.split("|").collect { |elem| elem.strip }
      end
    end

    def build_record_params_hash(parsed_data)
      parsed_data.inject([]) do |array, row|
        array << {  :last_name => row[0],
                    :first_name => row[1],
                    :middle_initial => row[2],
                    :gender => row[3],
                    :fav_color => row[4],
                    :dob => row[5]  }
      end
    end
end
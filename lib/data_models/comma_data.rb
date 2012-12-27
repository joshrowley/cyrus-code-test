require 'csv'

class CommaData
  attr_reader :raw_data

  def initialize(file_path)
    @raw_data = File.open(file_path).read
  end

  def parse_record_params
    build_record_params_hash(parsed_data)
  end

  private

    def parsed_data
      CSV.parse(raw_data)
    end

    def build_record_params_hash(parsed_data)
      parsed_data.inject([]) do |array, row|
        row = row.collect { |elem| elem.strip }
        array << {  :last_name => row[0],
                    :first_name => row[1],
                    :gender => row[2],
                    :fav_color => row[3],
                    :dob => row[4]  }
      end
    end

end
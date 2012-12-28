class AbstractData
  attr_reader :raw_data

  def initialize(file_path)
    raise NotImplementedError, "Cannot directly instantiate AbstractData" if self.class == AbstractData
    @raw_data = File.open(file_path).read
  end

  def parse_record_params
    build_record_params_from_parsed_data
  end
end

class CommaData < AbstractData
  private

    def parsed_data
      CSV.parse(raw_data)
    end

    def build_record_params_from_parsed_data
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

class PipeData < AbstractData
  private
  
    def parsed_data
      raw_data.lines.collect do |line|
        line.split("|").collect { |elem| elem.strip }
      end
    end

    def build_record_params_from_parsed_data
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

class SpaceData < AbstractData
  private

    def parsed_data
      raw_data.lines.collect do |line|
        line.split(" ").collect { |elem| elem.strip }
      end
    end

    def build_record_params_from_parsed_data
      parsed_data.inject([]) do |array, row|
        array << {  :last_name => row[0],
                    :first_name => row[1],
                    :middle_initial => row[2],
                    :gender => row[3],
                    :dob => row[4],
                    :fav_color => row[5]  }
      end
    end
end
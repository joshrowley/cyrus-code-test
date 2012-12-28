class Record

  ATTRS = :last_name, :first_name, :gender, :dob, :fav_color

  ATTRS.each { |attribute| attr_reader attribute }

  def initialize(args)
    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @gender = parse_gender(args[:gender])
    @dob = parse_date(args[:dob])
    @fav_color = args[:fav_color]
  end

  def ==(other_record)
    true if equivalent_attributes_with(other_record).count == ATTRS.count
  end

  private

    def parse_gender(gender_string)
      case gender_string[0].downcase
      when "f"
        :female
      when "m"
        :male
      else
        raise ArgumentError, "Gender must be male or female"
      end
    end

    def parse_date(date_string)
      date_args = date_string.split(/(?:\/|-)/).collect { |elem| elem.to_i }
      Date.new(date_args[2], date_args[0], date_args[1])
    end

    def equivalent_attributes_with(other_record)
      ATTRS.select do |attribute|
        self.send(attribute) == other_record.send(attribute)
      end
    end
end
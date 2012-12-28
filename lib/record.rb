class Record
  attr_reader :last_name, :first_name, :gender, :dob, :fav_color

  def initialize(args)
    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @gender = parse_gender(args[:gender])
    @dob = parse_date(args[:dob])
    @fav_color = args[:fav_color]
  end

  def ==(other_record)
    equivalent_attrs = [:last_name, :first_name, :gender, :dob, :fav_color].select do |attr|
      self.send(attr) == other_record.send(attr)
    end
    true if equivalent_attrs.count == 5
  end

  private

    def parse_gender(gender_string)
      case gender_string[0].downcase
      when "f"
        :female
      when "m"
        :male
      end
    end

    def parse_date(date_string)
      date_args = date_string.split(/(?:\/|-)/).collect { |elem| elem.to_i }
      Date.new(date_args[2], date_args[0], date_args[1])
    end

end
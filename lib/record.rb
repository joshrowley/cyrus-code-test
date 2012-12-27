require 'date'
class Record
  attr_reader :last_name, :first_name, :gender, :dob, :fav_color

  def initialize(args)
    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @gender = args[:gender]
    @dob = parse_date(args[:dob])
    @fav_color = args[:fav_color]
  end

  private

    def parse_date(date_string)
      date_args = date_string.split(/(?:\/|-)/).collect { |elem| elem.to_i }
      Date.new(date_args[2], date_args[0], date_args[1])
    end

end
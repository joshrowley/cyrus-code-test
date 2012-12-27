class Record
  attr_reader :last_name, :first_name, :gender, :dob, :fav_color

  def initialize(args)
    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @gender = args[:gender]
    @dob = args[:dob]
    @fav_color = args[:fav_color]
  end

end
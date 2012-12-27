require 'spec_helper'

describe SpaceData do

  let(:raw_data) do
    <<-DATA
      Kournikova Anna F F 6-3-1975 Red
      Hingis Martina M F 4-2-1979 Green
      Seles Monica H F 12-2-1973 Black
    DATA
  end

  let(:space_data) { SpaceData.new(raw_data) }  

  describe "#initialize" do

    it "should store raw data upon creation" do
      space_data.raw_data.should == raw_data
    end

  end

  describe "#parse" do
    it "should parse raw_data into an array of hashes with record object params" do
      parsed_data = [
        {:last_name => "Kournikova", :first_name => "Anna", :middle_initial => "F", :gender => "F", :dob => "6-3-1975", :fav_color => "Red"},
        {:last_name => "Hingis", :first_name => "Martina", :middle_initial => "M", :gender => "F", :dob => "4-2-1979", :fav_color => "Green"},
        {:last_name => "Seles", :first_name => "Monica", :middle_initial => "H", :gender => "F", :dob => "12-2-1973", :fav_color => "Black"}
      ]
      space_data.parse.should == parsed_data
    end
  end

end
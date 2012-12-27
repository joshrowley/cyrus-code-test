require 'spec_helper'

describe SpaceData do

  let(:file_path) { "spec/fixtures/space.txt" }
  let(:raw_data) { File.open(file_path).read }
  let(:space_data) { SpaceData.new(file_path) }  

  describe "#initialize" do

    it "should store raw data from a file" do
      space_data.raw_data.should == raw_data
    end

  end

  describe "#parse_record_params" do
    it "should parse raw_data into an array of hashes with record object params" do
      parsed_record_params = [
        {:last_name => "Kournikova", :first_name => "Anna", :middle_initial => "F", :gender => "F", :dob => "6-3-1975", :fav_color => "Red"},
        {:last_name => "Hingis", :first_name => "Martina", :middle_initial => "M", :gender => "F", :dob => "4-2-1979", :fav_color => "Green"},
        {:last_name => "Seles", :first_name => "Monica", :middle_initial => "H", :gender => "F", :dob => "12-2-1973", :fav_color => "Black"}
      ]
      space_data.parse_record_params.should == parsed_record_params
    end
  end

end
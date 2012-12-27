require 'spec_helper'

describe CommaData do

  let(:file_path) { "spec/fixtures/comma.txt" }
  let(:raw_data) { File.open(file_path).read }
  let(:comma_data) { CommaData.new(file_path) }

  describe "#initialize" do

    it "should store raw data from a file" do
      comma_data.raw_data.should == raw_data
    end

  end

  describe "#parse_record_params" do
    
    it "should parse raw_data into an array of hashes with record object params" do
      parsed_record_params = [
        {:last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :fav_color => "Tan", :dob => "2/13/1943"},
        {:last_name => "Bishop", :first_name => "Timothy", :gender => "Male", :fav_color => "Yellow", :dob => "4/23/1967"},
        {:last_name => "Kelly", :first_name => "Sue", :gender => "Female", :fav_color => "Pink", :dob => "7/12/1959"}
      ]
      comma_data.parse_record_params.should == parsed_record_params
    end

  end

end
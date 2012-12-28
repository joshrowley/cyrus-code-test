require 'spec_helper'

describe AbstractData do

  describe "#initialize" do

    it "should raise an error if you try to instantiate AbstractData" do
      expect { AbstractData.new("spec/fixtures/comma.txt") }.to raise_error
    end

  end

end

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

describe PipeData do
  let(:file_path) { "spec/fixtures/pipe.txt" }
  let(:raw_data) { File.open(file_path).read }
  let(:pipe_data) { PipeData.new(file_path) }

  describe "#initialize" do

    it "should store raw data from a file" do
      pipe_data.raw_data.should == raw_data
    end

  end

  describe "#parse_record_params" do

    it "should parse raw_data into an array of hashes with record object params" do
      parsed_record_params = [
        {:last_name => "Smith", :first_name => "Steve", :middle_initial => "D", :gender => "M", :fav_color => "Red", :dob => "3-3-1985"},
        {:last_name => "Bonk", :first_name => "Radek", :middle_initial => "S", :gender => "M", :fav_color => "Green", :dob => "6-3-1975"},
        {:last_name => "Bouillon", :first_name => "Francis", :middle_initial => "G", :gender => "M", :fav_color => "Blue", :dob => "6-3-1975"}
      ]
      pipe_data.parse_record_params.should == parsed_record_params
    end

  end
end

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
require 'spec_helper'

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
require 'spec_helper'

describe CommaDelimited do

  let(:source_path) { "spec/fixtures/comma_delimited.txt" }
  let(:comma_separated_data) { CommaDelimited.new(source_path) }

  describe "#initialize" do

    it "should store a path to a CSV file" do
      comma_separated_data.source_path.should == source_path
    end

  end

  describe "#parse" do
    
    it "should parse the source file into an array of hashes" do
Hingis, Martina, female, green, 4/2/1979
Kelly, Sue, female, pink, 7/12/1959 
Kournikova, Anna, female, red, 6/3/1975

      comma_separated_data.parse.should == [
        {:last_name => "Hingis", :first_name => "Martina", :gender => "female", :fav_color => "green", :dob =>}

      ]
    end

  end

end
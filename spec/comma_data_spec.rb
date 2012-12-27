require 'spec_helper'

describe CommaData do

  let(:raw_data) do
    <<-DATA
      Abercrombie, Neil, Male, Tan, 2/13/1943
      Bishop, Timothy, Male, Yellow, 4/23/1967
      Kelly, Sue, Female, Pink, 7/12/1959
    DATA
  end
  let(:comma_data) { CommaDelimited.new(raw_data) }

  describe "#initialize" do

    it "should store raw data upon creation" do
      comma_data.raw_data.should == source_path
    end

  end

  describe "#parse" do
    
    it "should parse raw_data into an array of hashes with record object params" do
      parsed_data = [
        {:last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :fav_color => "Tan", :dob => "2/13/1943"},
        {:last_name => "Bishop", :first_name => "Tom", :gender => "Male", :fav_color => "Yellow", :dob => "4/23/1967"},
        {:last_name => "Kelly", :first_name => "Sue", :gender => "Female", :fav_color => "Pink", :dob => "7/12/1959"}
      ]
      comma_data.parse.should == parsed_data
    end

  end

end
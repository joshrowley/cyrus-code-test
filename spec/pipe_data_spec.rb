require 'spec_helper'

describe PipeData do

  let(:raw_data) do
    <<-DATA
      Smith | Steve | D | M | Red | 3-3-1985
      Bonk | Radek | S | M | Green | 6-3-1975
      Bouillon | Francis | G | M | Blue | 6-3-1975
    DATA
  end
  let(:pipe_data) { PipeData.new(raw_data) }

  describe "#initialize" do

    it "should store raw data upon creation" do
      pending
      pipe_data.raw_data.should == raw_data
    end

  end

  describe "#parse" do

    it "should parse raw_data into an array of hashes with record object params" do
      pending
      parsed_data = [
        {:last_name => "Smith", :first_name => "Steve", :middle_initial => "D", :gender => "M", :fav_color => "Red", :dob => "3-3-1985"},
        {:last_name => "Bonk", :first_name => "Radek", :middle_initial => "S", :gender => "M", :fav_color => "Green", :dob => "6-3-1975"},
        {:last_name => "Bouillon", :first_name => "Francis", :middle_initial => "G", :gender => "M", :fav_color => "Blue", :dob => "6-3-1975"}
      ]
      pipe_data.parse.should == parsed_data
    end

  end


end
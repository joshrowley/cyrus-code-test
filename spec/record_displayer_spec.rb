require 'spec_helper'

describe RecordDisplayer do

let(:records) do
[ Record.new(:last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :fav_color => "Tan", :dob => "2/13/1943"),
  Record.new(:last_name => "Bishop", :first_name => "Timothy", :gender => "Male", :fav_color => "Yellow", :dob => "4/23/1967"),
  Record.new(:last_name => "Kelly", :first_name => "Sue", :gender => "Female", :fav_color => "Pink", :dob => "7/12/1959"),
  Record.new(:last_name => "Smith", :first_name => "Steve", :gender => "M", :fav_color => "Red", :dob => "3-3-1985"),
  Record.new(:last_name => "Bonk", :first_name => "Radek", :gender => "M", :fav_color => "Green", :dob => "6-3-1975"),
  Record.new(:last_name => "Bouillon", :first_name => "Francis", :gender => "M", :fav_color => "Blue", :dob => "6-3-1975"),
  Record.new(:last_name => "Kournikova", :first_name => "Anna", :gender => "F", :fav_color => "Red", :dob => "6-3-1975"),
  Record.new(:last_name => "Hingis", :first_name => "Martina", :gender => "F", :fav_color => "Green", :dob => "4-2-1979"),
  Record.new(:last_name => "Seles", :first_name => "Monica", :gender => "F", :fav_color => "Black", :dob => "12-2-1973")  ]
end

let(:records_by_gender_then_last_name) do
[ Record.new(:last_name => "Hingis", :first_name => "Martina", :gender => "F", :fav_color => "Green", :dob => "4-2-1979"),
  Record.new(:last_name => "Kelly", :first_name => "Sue", :gender => "Female", :fav_color => "Pink", :dob => "7/12/1959"),
  Record.new(:last_name => "Kournikova", :first_name => "Anna", :gender => "F", :fav_color => "Red", :dob => "6-3-1975"),
  Record.new(:last_name => "Seles", :first_name => "Monica", :gender => "F", :fav_color => "Black", :dob => "12-2-1973"),
  Record.new(:last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :fav_color => "Tan", :dob => "2/13/1943"),
  Record.new(:last_name => "Bishop", :first_name => "Timothy", :gender => "Male", :fav_color => "Yellow", :dob => "4/23/1967"),
  Record.new(:last_name => "Bonk", :first_name => "Radek", :gender => "M", :fav_color => "Green", :dob => "6-3-1975"),
  Record.new(:last_name => "Bouillon", :first_name => "Francis", :gender => "M", :fav_color => "Blue", :dob => "6-3-1975"),
  Record.new(:last_name => "Smith", :first_name => "Steve", :gender => "M", :fav_color => "Red", :dob => "3-3-1985")  ]
end

let(:records_by_last_name) do
[ Record.new(:last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :fav_color => "Tan", :dob => "2/13/1943"),
  Record.new(:last_name => "Bishop", :first_name => "Timothy", :gender => "Male", :fav_color => "Yellow", :dob => "4/23/1967"),
  Record.new(:last_name => "Bonk", :first_name => "Radek", :gender => "M", :fav_color => "Green", :dob => "6-3-1975"),
  Record.new(:last_name => "Bouillon", :first_name => "Francis", :gender => "M", :fav_color => "Blue", :dob => "6-3-1975"),
  Record.new(:last_name => "Hingis", :first_name => "Martina", :gender => "F", :fav_color => "Green", :dob => "4-2-1979"),
  Record.new(:last_name => "Kelly", :first_name => "Sue", :gender => "Female", :fav_color => "Pink", :dob => "7/12/1959"),
  Record.new(:last_name => "Kournikova", :first_name => "Anna", :gender => "F", :fav_color => "Red", :dob => "6-3-1975"),
  Record.new(:last_name => "Seles", :first_name => "Monica", :gender => "F", :fav_color => "Black", :dob => "12-2-1973"),
  Record.new(:last_name => "Smith", :first_name => "Steve", :gender => "M", :fav_color => "Red", :dob => "3-3-1985")  ]
end

let(:records_by_dob) do
[ Record.new(:last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :fav_color => "Tan", :dob => "2/13/1943"),
  Record.new(:last_name => "Kelly", :first_name => "Sue", :gender => "Female", :fav_color => "Pink", :dob => "7/12/1959"),
  Record.new(:last_name => "Bishop", :first_name => "Timothy", :gender => "Male", :fav_color => "Yellow", :dob => "4/23/1967"),
  Record.new(:last_name => "Seles", :first_name => "Monica", :gender => "F", :fav_color => "Black", :dob => "12-2-1973"),
  Record.new(:last_name => "Bonk", :first_name => "Radek", :gender => "M", :fav_color => "Green", :dob => "6-3-1975"),
  Record.new(:last_name => "Bouillon", :first_name => "Francis", :gender => "M", :fav_color => "Blue", :dob => "6-3-1975"),
  Record.new(:last_name => "Kournikova", :first_name => "Anna", :gender => "F", :fav_color => "Red", :dob => "6-3-1975"),
  Record.new(:last_name => "Hingis", :first_name => "Martina", :gender => "F", :fav_color => "Green", :dob => "4-2-1979"),
  Record.new(:last_name => "Smith", :first_name => "Steve", :gender => "M", :fav_color => "Red", :dob => "3-3-1985")  ]
end

let(:formatted_records) { "Abercrombie Neil Male 2/13/1943 Tan\nBishop Timothy Male 4/23/1967 Yellow\nKelly Sue Female 7/12/1959 Pink\nSmith Steve Male 3/3/1985 Red\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue\nKournikova Anna Female 6/3/1975 Red\nHingis Martina Female 4/2/1979 Green\nSeles Monica Female 12/2/1973 Black" }
let(:formatted_by_dob) { "Abercrombie Neil Male 2/13/1943 Tan\nKelly Sue Female 7/12/1959 Pink\nBishop Timothy Male 4/23/1967 Yellow\nSeles Monica Female 12/2/1973 Black\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue\nKournikova Anna Female 6/3/1975 Red\nHingis Martina Female 4/2/1979 Green\nSmith Steve Male 3/3/1985 Red" }
let(:formatted_by_desc_last_name) { "Smith Steve Male 3/3/1985 Red\nSeles Monica Female 12/2/1973 Black\nKournikova Anna Female 6/3/1975 Red\nKelly Sue Female 7/12/1959 Pink\nHingis Martina Female 4/2/1979 Green\nBouillon Francis Male 6/3/1975 Blue\nBonk Radek Male 6/3/1975 Green\nBishop Timothy Male 4/23/1967 Yellow\nAbercrombie Neil Male 2/13/1943 Tan" }
let(:formatted_by_gender_then_last_name) { "Hingis Martina Female 4/2/1979 Green\nKelly Sue Female 7/12/1959 Pink\nKournikova Anna Female 6/3/1975 Red\nSeles Monica Female 12/2/1973 Black\nAbercrombie Neil Male 2/13/1943 Tan\nBishop Timothy Male 4/23/1967 Yellow\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue\nSmith Steve Male 3/3/1985 Red" }

let(:record_displayer) { RecordDisplayer.new(records) }


  describe "#initialize" do

    it "should store records" do
      record_displayer.records.should == records
    end

  end

  describe "#records_by_gender_then_last_name" do

    it "should sort records by gender then by last_name" do
      record_displayer.records_by_gender_then_last_name.should == records_by_gender_then_last_name
    end

  end

  describe "#records_by_last_name" do

    it "should sort records by last_name ascending by default" do
      record_displayer.records_by_last_name.should == records_by_last_name
    end

    it "should sort records by last_name descending when passed in the option" do
      record_displayer.records_by_last_name(:desc).should == records_by_last_name.reverse
    end

  end

  describe "#records_by_dob" do

    it "should sort records by date of birth" do
      record_displayer.records_by_dob.should == records_by_dob
    end

  end

  describe "#display_by_gender_then_last_name"do

    it "should return a correctly formatted string by gender then last name"do
      record_displayer.display_by_gender_then_last_name.should == formatted_by_gender_then_last_name
    end

  end

  describe "#display_by_dob" do

    it "should return a correctly formatted string by date of birth" do
      record_displayer.display_by_dob.should == formatted_by_dob
    end

  end

  describe "#display_by_desc_last_name" do

    it "should return a correctly formatted string by last name descending" do
      record_displayer.display_by_desc_last_name.should == formatted_by_desc_last_name
    end

  end

end
require 'spec_helper'

describe Record do

  describe "#initialize" do

    let(:dob) { Date.new(1979, 4, 2) }
    let(:record_params) do
      { :last_name => "Hingis",
        :first_name => "Martina",
        :gender => "Female",
        :dob => "4-2-1979",
        :fav_color => "Green" }
    end
    let(:record) { Record.new(record_params)}

    it "should store last name" do
      record.last_name.should == "Hingis"
    end

    it "should store first name" do
      record.first_name.should == "Martina"
    end

    context "it should store different gender string inputs as a standard symbol" do

      it "should store Female as :female" do
        record.gender.should == :female
      end

      it "should store F as :female" do
      end

      it "should store Male as :male" do
      end

      it "should store M as :male" do
      end

    end

    context "it should store date of birth as a date object" do

      it "should convert strings with %m-%d-%Y format to date objects" do
        record.dob.should == Date.new(1979, 4, 2)
      end

      it "should convert strings with %m/%d/%Y format to date objects" do
        record_params = { :last_name => "Hingis",
        :first_name => "Martina",
        :gender => "Female",
        :dob => "4/2/1979",
        :fav_color => "Green" }
        record = Record.new(record_params)
        record.dob.should == Date.new(1979, 4, 2)
      end

    end

    it "should store favorite color" do
      record.fav_color.should == "Green"
    end

  end

end
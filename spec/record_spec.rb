require 'spec_helper'

describe Record do

  describe "#initialize" do

    let(:dob) { Date.new(1979, 4, 2) }
    let(:record_params) do
      { :last_name => "Hingis",
        :first_name => "Martina",
        :gender => "Female",
        :dob => dob,
        :fav_color => "Green" }
    end
    let(:record) { Record.new(record_params)}

    it "should store last name" do
      record.last_name.should == "Hingis"
    end

    it "should store first name" do
      record.first_name.should == "Martina"
    end

    it "should store gender" do
      record.gender.should == "Female"
    end

    it "should store date of birth" do
      record.dob.should == dob
    end

    it "should store favorite color" do
      record.fav_color.should == "Green"
    end

  end

end
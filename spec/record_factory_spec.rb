describe RecordFactory do

  describe ".create_from_data" do

    let(:comma_data_file_path) { "spec/fixtures/comma.txt" }
    let(:pipe_data_file_path) { "spec/fixtures/pipe.txt" }
    let(:space_data_file_path) { "spec/fixtures/space.txt" }

    let(:comma_data) { CommaData.new(comma_data_file_path) }
    let(:pipe_data) { PipeData.new(pipe_data_file_path) }
    let(:space_data) { SpaceData.new(space_data_file_path) }

    it "should build records from parsable data objects" do
      result = [
        Record.new(:last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :fav_color => "Tan", :dob => "2/13/1943"),
        Record.new(:last_name => "Bishop", :first_name => "Timothy", :gender => "Male", :fav_color => "Yellow", :dob => "4/23/1967"),
        Record.new(:last_name => "Kelly", :first_name => "Sue", :gender => "Female", :fav_color => "Pink", :dob => "7/12/1959"),
        Record.new(:last_name => "Smith", :first_name => "Steve", :gender => "M", :fav_color => "Red", :dob => "3-3-1985"),
        Record.new(:last_name => "Bonk", :first_name => "Radek", :gender => "M", :fav_color => "Green", :dob => "6-3-1975"),
        Record.new(:last_name => "Bouillon", :first_name => "Francis", :gender => "M", :fav_color => "Blue", :dob => "6-3-1975"),
        Record.new(:last_name => "Kournikova", :first_name => "Anna", :gender => "F", :fav_color => "Red", :dob => "6-3-1975"),
        Record.new(:last_name => "Hingis", :first_name => "Martina", :gender => "F", :fav_color => "Green", :dob => "4-2-1979"),
        Record.new(:last_name => "Seles", :first_name => "Monica", :gender => "F", :fav_color => "Black", :dob => "12-2-1973")
      ]
      RecordFactory.create_from_data([comma_data, pipe_data, space_data]).should eql(result)
    end

  end

end
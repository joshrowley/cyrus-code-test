describe RecordFactory do

  describe ".create_from_data" do

    let(:comma_raw_data) do
      <<-DATA
        Abercrombie, Neil, Male, Tan, 2/13/1943
        Bishop, Timothy, Male, Yellow, 4/23/1967
        Kelly, Sue, Female, Pink, 7/12/1959
      DATA
    end

    let(:pipe_raw_data) do
      <<-DATA
        Smith | Steve | D | M | Red | 3-3-1985
        Bonk | Radek | S | M | Green | 6-3-1975
        Bouillon | Francis | G | M | Blue | 6-3-1975
      DATA
    end

    let(:space_raw_data) do
      <<-DATA
        Kournikova Anna F F 6-3-1975 Red
        Hingis Martina M F 4-2-1979 Green
        Seles Monica H F 12-2-1973 Black
      DATA
    end

    let(:comma_data) { CommaData.new(comma_raw_data) }
    let(:pipe_data) { PipeData.new(pipe_raw_data) }
    let(:space_data) { SpaceData.new(space_raw_data) }

    it "should build records from parsable data objects" do
      result = [
        Record.new(:last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :fav_color => "Tan", :dob => Date.new(1943, 2, 13)),
        Record.new(:last_name => "Bishop", :first_name => "Timothy", :gender => "Male", :fav_color => "Yellow", :dob => Date.new(1967, 4, 23)),
        Record.new(:last_name => "Kelly", :first_name => "Sue", :gender => "Female", :fav_color => "Pink", :dob => Date.new(1959, 7, 12)),
        Record.new(:last_name => "Smith", :first_name => "Steve", :gender => "M", :fav_color => "Red", :dob => Date.new(1985, 3, 3)),
        Record.new(:last_name => "Bonk", :first_name => "Radek", :gender => "M", :fav_color => "Green", :dob => Date.new(1975, 6, 3)),
        Record.new(:last_name => "Bouillon", :first_name => "Francis", :gender => "M", :fav_color => "Blue", :dob => Date.new(1975, 6, 3)),
        Record.new(:last_name => "Kournikova", :first_name => "Anna", :gender => "F", :fav_color => "Red", :dob => Date.new(1975, 6, 3)),
        Record.new(:last_name => "Hingis", :first_name => "Martina", :gender => "F", :fav_color => "Green", :dob => Date.new(1979, 4, 2)),
        Record.new(:last_name => "Seles", :first_name => "Monica", :gender => "F", :fav_color => "Black", :dob => Date.new(1973, 12, 2))
      ]
      RecordFactory.create_from_data([comma_data, pipe_data, space_data]).should == result
    end

  end

end
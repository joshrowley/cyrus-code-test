require_relative 'lib/helper'

desc "Display sorted records from source files"
task :display_records do
  data = [  CommaData.new("source_data/comma.txt"),
            PipeData.new("source_data/pipe.txt"),
            SpaceData.new("source_data/space.txt")  ]
  records = RecordFactory.create_from_data(data)
  record_displayer = RecordDisplayer.new(records)
  puts "Output 1:"
  puts record_displayer.display_by_gender_then_last_name
  puts "\nOutput 2:"
  puts record_displayer.display_by_dob
  puts "\nOutput 3:"
  puts record_displayer.display_by_desc_last_name
end

task :default => 'display_records'
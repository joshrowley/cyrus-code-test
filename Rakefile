require_relative 'spec/spec_helper'
require 'debugger'

desc "Display sorted records from source files"
task :display_records do
  data = [  CommaData.new("source_data/comma.txt"),
            PipeData.new("source_data/pipe.txt"),
            SpaceData.new("source_data/space.txt")  ]
  records = RecordFactory.create_from_data(data)
  record_displayer = RecordDisplayer.new(records)
  puts record_displayer.format_for_output
end

task :default => 'display_records'
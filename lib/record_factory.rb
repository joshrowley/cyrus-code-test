class RecordFactory

  def self.create_from_data(data)
    record_objects = data.collect do |data_obj|
      data_obj.parse_record_params.collect do |params|
        Record.new(params)
      end
    end
    record_objects.flatten
  end

end
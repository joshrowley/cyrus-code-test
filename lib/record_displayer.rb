class RecordDisplayer
  attr_reader :records

  def initialize(records)
    @records = records
  end

  def format_for_output
    records.collect do |record|
      "#{record.last_name.to_s} #{record.first_name.to_s} #{record.gender.to_s} #{record.dob.to_s} #{record.fav_color.to_s}"
    end
  end

  def sort_by_gender
  end

  def sort_by_last_name(order = nil)
    records.sort! do |a,b|
      a.last_name.downcase <=> b.last_name.downcase
    end
    order == :desc ? records.reverse : records
  end

  def sort_by_dob
    records.sort do |a,b|
      a.dob <=> b.dob
    end
  end

end
class RecordDisplayer
  attr_reader :records

  def initialize(records)
    @records = records
  end

  def display_by_dob
    format_for_output(records_by_dob)
  end

  def display_by_gender_then_last_name
    format_for_output(records_by_gender_then_last_name)
  end

  def display_by_desc_last_name
    format_for_output(records_by_last_name(:desc))
  end

  def records_by_gender_then_last_name
    records.sort do |a,b|
      [a.gender, a.last_name] <=> [b.gender, b.last_name]
    end
  end

  def records_by_last_name(order = nil)
    records.sort! do |a,b|
      a.last_name.downcase <=> b.last_name.downcase
    end
    order == :desc ? records.reverse : records
  end

  def records_by_dob
    records.sort do |a,b|
      a.dob <=> b.dob
    end
  end

  private

    def format_for_output(records)
      build_formatted_record_string(records).join("\n")
    end

    def build_formatted_record_string(records)
      records.collect do |record|
        "#{record.last_name.to_s} #{record.first_name.to_s} #{format_gender(record.gender)} #{format_date(record.dob)} #{record.fav_color.to_s}"
      end
    end

    def format_gender(gender)
      gender.to_s.capitalize
    end

    def format_date(date)
      date.strftime("%-m/%-d/%Y")
    end

end
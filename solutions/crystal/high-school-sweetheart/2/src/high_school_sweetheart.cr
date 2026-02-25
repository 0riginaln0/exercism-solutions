class HighSchoolSweetheart
  def self.clean_up_name(name : String)
    name.gsub("-", " ").strip
  end

  def self.first_letter(name)
    clean_up_name(name)[0].to_s
  end

  def self.initial(name)
    first_letter(name).upcase.insert(1, ".")
  end

  def self.pair(name1, name2)
    ascii = String::Builder.new(capacity: 13)
    ascii << "❤ "
    ascii << initial(name1)
    ascii << "  +  "
    ascii << initial(name2)
    ascii << " ❤"
    ascii.to_s
  end
end

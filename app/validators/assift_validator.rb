class AssiftValidator
  def self.contains_pikachu?(text:)
    return false if text.nil?
    text.include?("ピカチュウ")
  end
end
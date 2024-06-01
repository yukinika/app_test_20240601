class AssiftValidator
  def contains_pikachu?(text:)
    return false if text.nil?
    text.include?("ピカチュウ")
  end
end

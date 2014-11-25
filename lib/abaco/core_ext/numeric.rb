class Numeric
  # Converts the number into Italian using #{Abaco::Converter}.
  #
  # @return [String] the converted number
  def to_italian
    Abaco::Converter.convert(self)
  end
end

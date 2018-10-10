class BinaryTranslator
  attr_reader :binary, :words, :inverted
  def initialize
    @words = words
    @binary = binary
    @alpha_to_binary = {
      " " => "000000",
      "a" => "000001",
      "b" => "000010",
      "c" => "000011",
      "d" => "000100",
      "e" => "000101",
      "f" => "000110",
      "g" => "000111",
      "h" => "001000",
      "i" => "001001",
      "j" => "001010",
      "k" => "001011",
      "l" => "001100",
      "m" => "001101",
      "n" => "001110",
      "o" => "001111",
      "p" => "010000",
      "q" => "010001",
      "r" => "010010",
      "s" => "010011",
      "t" => "010100",
      "u" => "010101",
      "v" => "010110",
      "w" => "010111",
      "x" => "011000",
      "y" => "011001",
      "z" => "011010"
    }
    @inverted = @alpha_to_binary.invert

  end

  def translate(key)
    new_key = key.downcase.chars
    binary = new_key.map do |key|
             @alpha_to_binary[key]
             end
    binary.join
  end

  def translate_to_text(binary)
    new_binary = binary.scan(/....../)
    words = new_binary.map do |key|
            @inverted[key]
          end
    words.join
  end
end

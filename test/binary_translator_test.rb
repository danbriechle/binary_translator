require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_translator'
require 'pry'

class BinaryTest < MiniTest::Test

 def test_it_exists
   bt = BinaryTranslator.new
   assert_instance_of BinaryTranslator, bt
 end
 def test_it_can_translate
   bt = BinaryTranslator.new
   assert_equal "000001",  bt.translate("a")
 end

 def test_it_can_translate_words
   bt = BinaryTranslator.new
   expected = "010100010101010010001001001110000111"
   assert_equal expected,  bt.translate("turing")
 end

 def test_it_can_translate_capital_letters
   bt = BinaryTranslator.new
   assert_equal "000001",  bt.translate("A")
 end

 def test_it_can_translate_capital_words
   bt = BinaryTranslator.new
   expected = "010100010101010010001001001110000111"
   assert_equal expected,  bt.translate("TURING")
 end

 def test_it_supports_spaces
   bt = BinaryTranslator.new
   assert_equal "000000",  bt.translate(" ")
 end

 def test_it_ignores_non_letters
   bt = BinaryTranslator.new
   assert_equal "",  bt.translate("!@{$#%^&*()}")
 end

 def test_it_translates_simple_sentences
   bt = BinaryTranslator.new
   expected = "001000000101001100001100001111000000010111001111010010001100000100"
   assert_equal expected,  bt.translate("Hello World!")
 end

 def test_it_can_un_translate
   bt = BinaryTranslator.new
   asserted = "001000000101001100001100001111000000010111001111010010001100000100"
   assert_equal "hello world", bt.translate_to_text(asserted)
 end




end

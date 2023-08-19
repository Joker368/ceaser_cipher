# frozen_string_literal: true

require_relative "ceaser_cipher/version"

module TheOdinProject
  class CeaserCipher
    attr_accessor :phrase, :shift, :cipher

    def initialize(shift, phrase: nil, cipher: nil)
      @shift = shift
      @phrase = phrase || reverse_cipher(cipher)
      @cipher = cipher || find_cipher(phrase)
    end

    private
    LETTERS = ('a'..'z').to_a

    def reverse_cipher(cipher)
      evaluate_ceaser_cipher(shift, cipher, reverse: true)
    end

    def find_cipher(phrase)
      evaluate_ceaser_cipher(shift, phrase)
    end

    def evaluate_ceaser_cipher(shift, string, reverse: false)
      letters = reverse ? LETTERS.reverse : LETTERS
      cipher = ''
      string.each_char do |char|
        is_uppercase = (char == char.upcase)
        cipher += if letters.include?(char.downcase)
          is_uppercase ? letters[letters.find_index(char.downcase) - shift].upcase : letters[letters.find_index(char.downcase) - shift]
        else
          char
        end
      end
      cipher
    end
  end
end

# pp TheOdinProject::CeaserCipher.new(27, phrase: "Test!123") # cipher Uftu!123
# pp TheOdinProject::CeaserCipher.new(27, cipher: 'Sdrs!123') # phrase Test!123
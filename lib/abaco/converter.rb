module Abaco
  # Number converter
  #
  # The convert converts numbers into Italian.
  #
  # @author Alessandro Desantis <desa.alessandro@gmail.com>
  class Converter
    EXCEPTIONS = {
      'unocento'    => 'cento',
      'unomila'     => 'mille',
      'uno m'       => 'un m',
      /t\wmille/    => 'tunomila',
      'ntaotto'     => 'ntotto',
      'ntauno'      => 'ntuno',
      'un miliardi' => 'un miliardo',
      'un milioni'  => 'un milione',
      'ntoo'        => 'nto'
    }

    NUMBERS = {
      units: ['', 'uno', 'due', 'tre', 'quattro', 'cinque', 'sei', 'sette', 'otto', 'nove'],
      teens: ['dieci', 'undici', 'dodici', 'tredici', 'quattordici', 'quindici', 'sedici', 'diciassette', 'diciotto', 'diciannove'],
      tens:  ['', 'dieci', 'venti', 'trenta', 'quaranta', 'cinquanta', 'sessanta', 'settanta', 'ottanta', 'novanta']
    }

    SUFFIXES = {
      3 => 'mila',
      6 => 'milioni',
      9 => 'miliardi'
    }

    MAX_NUMBER = 999999999999

    # Converts the given number into Italian words.
    #
    # @param number [Numeric] the number to convert (<= 999.999.999.999)
    #
    # @return [String]
    #   A string in the 'NUMBER/DD' form, 'DD' being two decimal digits (these
    #   will be added even if the number is a Fixnum).
    #
    # @raise BigNumberError if the number is too big to be converted
    def self.convert(number)
      if number > MAX_NUMBER
        raise BigNumberError, "Abaco can't convert numbers bigger than #{MAX_NUMBER}"
      end

      number = number.to_f

      tmp = number.to_i
      result = ''

      9.step(3, -3) do |n|
        # Is the number in the 10^n form?
        if Math.log10(tmp).to_i >= n
          result += describe_part(tmp / 10 ** n)

          result += ' ' if n >= 6
          result += SUFFIXES[n]
          result += ' ' if n >= 6
        end

        tmp %= 10 ** n
      end

      decimal_part = '/'
      decimal_part += ('%.2f' % number).split('.').last

      result += describe_part(tmp) + decimal_part

      EXCEPTIONS.each_pair do |search, replace|
        result.gsub! search, replace
      end

      result
    end

    private

    def self.describe_part(number)
      tmp = number
      result = ''

      result += NUMBERS[:units][tmp / 100] + 'cento' if tmp >= 100

      if (tmp %= 100) >= 20
        result += NUMBERS[:tens][tmp / 10]
      elsif tmp >= 10 && tmp < 20
        result += NUMBERS[:teens][tmp % 10]
        tmp = 0
      end

      result + NUMBERS[:units][tmp % 10]
    end

    # Big number error
    #
    # This exception is raised when Abaco tries to convert a number that is too
    # big to be translated (> #{MAX_NUMBER}).
    #
    # @author Alessandro Desantis <desa.alessandro@gmail.com>
    class BigNumberError < StandardError
    end
  end
end

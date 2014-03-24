class Card < ActiveRecord::Base

	def self.luhn(number)
		cc_number = number.gsub('-', '').reverse
		sum, i = 0, 0

        cc_number.each_char do |ch|
          n = ch.to_i
          n *= 2 if i.odd?
          n = 1 + (n - 10) if n >= 10
          sum += n
          i   += 1
        end
		(sum % 10).zero?
	end

end

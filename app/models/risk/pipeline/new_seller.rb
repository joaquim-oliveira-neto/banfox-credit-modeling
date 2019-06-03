module Risk
  module Pipeline
    class NewSeller
      def self.call(input_data, report)
        [
        ].each do |referee|
          referee.call(seller_cnpj, report)
        end
      end
    end
  end
end

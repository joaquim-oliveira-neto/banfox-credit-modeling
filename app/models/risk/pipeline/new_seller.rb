module Risk
  module Pipeline
    class NewSeller
      def self.call(seller_cnpj)
        [
        ].each do |referee|
          referee.call(seller_cnpj)
        end
      end
    end
  end
end

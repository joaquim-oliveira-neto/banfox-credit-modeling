module Risk
  module Referee
    class CompanyStatus < Base
      configure_identifier code: 'Referee::CompanyStatus',
                           title: 'Company Status',
                           description: 'Check if company status on serasa is active'

      def serasa_data(params)
        serasa_data = Risk::Service::Serasa.call(params)
        serasa_data.with_indifferent_access['dados_controle_empresa']['codigo_situacao_empresa']
      end

      def call(params)
        case serasa_data(params)
        when 'ativo'
          green!
        when ''
          yellow!
        when 'inativo'
          red!
        end
      end
    end
  end
end

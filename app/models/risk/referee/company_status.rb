module Risk
  module Referee
    class CompanyStatus < Base
      configure_identifier code: 'Referee::CompanyStatus',
                           title: 'Company Status',
                           description: 'Check if company status on serasa is active'

      def serasa_response(params)
        serasa_response = Risk::Service::Serasa.call(params)
        serasa_response.with_indifferent_access['dados_controle_empresa']['codigo_situacao_empresa']
      end

      def call(params)
        case serasa_response(params)
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

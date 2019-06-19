module Risk
  module Referee
    class CompanyStatus < Base
      configure_identifier code: 'Referee::CompanyStatus',
                           title: 'Company Status',
                           description: 'Check if company status on serasa is active'

      def call(presenters)
        case presenters[:company].status
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

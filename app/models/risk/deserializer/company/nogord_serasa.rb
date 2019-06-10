module Risk
  module Deserializer
    module Company
      class NogordSerasa
        def self.call(data=nil)
        end

        def initialize(data=nil)
        end

        def call
        end

        def summary(data)
          byebug
        end

        def last_pefin(data)
          return nil unless data.any?
          first_date = Date.parse(data.first['data_ocorrencia'])
          @last_pefin ||= data.inject(first_date) do |fd, pefin|
            ocurrence = Date.parse(pefin['data_ocorrencia'])
            return pefin if ocurrence > first_date

            data.first
          end

          @last_pefin
        end

        def last_refin(data)
          return nil unless data.any?
          first_date = Date.parse(data.first['data_ocorrencia'])
          @last_refin ||= data.inject(first_date) do |fd, refin|
            ocurrence = Date.parse(refin['data_ocorrencia'])
            return refin if ocurrence > first_date

            data.first
          end

          @last_refin
        end

        def count_serasa_searches(data)
          data&.reduce(0) do |total, n| 
            total + n['quantidade_consulta_por_empresa'] + n['quantidade_consulta_por_financeira']
          end
        end

        def count_company_searches(data)
          data&.reduce(0) do |total, n|
            total + n['quantidade_consulta_por_empresa']
          end
        end

        def count_financial_company_searches(data)
          data&.reduce(0) do |total, n|
            total + n['quantidade_consulta_por_financeira']
          end
        end

        def count_pefin(data)
          last_pefin(data)['quantidade_pendencias_financeiras']
        end

        def pefin_value(data)
          last_pefin(data)['valor']
        end

        def pefin_last_ocurrence(data)
          Date.parse(last_pefin(data)['data_ocorrencia'])
        end

        def count_refin(data)
          last_refin(data)['quantidade_refinanciamento']
        end

        def refin_value(data)
          last_refin(data)['valor']
        end

        def refin_last_ocurrence(data)
          last_ocurrence = last_refin(data)['data_ocorrencia']
          Date.parse(last_ocurrence)
        end

        def last_protest(data)
          return nil unless data.any?
          first_date = Date.parse(data.first['data_protesto'])
          @last_protest ||= data.inject(first_date) do |fd, refin|
            ocurrence = Date.parse(refin['data_protesto'])
            return refin if ocurrence > first_date

            data.first
          end

          @last_protest
        end

        def count_protest(data)
          last_protest(data)['quantidade_ocorrencias']
        end

        def protest_value(data)
          last_protest(data)['valor_protesto']
        end

        def protest_last_ocurrence(data)
          last_ocurrence = last_protest(data)['data_protesto']
          Date.parse(last_ocurrence)
        end

        def count_lawsuit(data)
          data.size
        end

        def lawsuit_value(data)
          data.reduce(0) do |total, n|
            total + n['valor_acao']
          end
        end

        def lawsuit_last_ocurrence(data)
          first_ocurrence = Date.parse(data.first['data_acao_judicial'])
          data.inject(first_ocurrence) do |fo, lo|
            last_ocurrence = Date.parse(lo['data_acao_judicial'])
            return last_ocurrence if last_ocurrence > first_ocurrence

            fo
          end
        end
      end
    end
  end
end

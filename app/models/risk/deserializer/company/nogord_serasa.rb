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
          {
            serasa_searches: count_serasa_searches(data['consultas_serasa']),
            last_serasa_search_date: last_serasa_search_date(data['consultas_serasa'])
          }.with_indifferent_access
        end

        def last_pefin(data)
          return nil unless data.any?

          @last_pefin ||= data.inject(data.first) do |last, current|
            current_date = Date.parse(current['data_ocorrencia'])
            last_date = Date.parse(last['data_ocorrencia'])

            current_date > last_date ? current : last
          end
        end

        def last_refin(data)
          return nil unless data.any?
          @last_refin ||= data.inject(data.first) do |last, current|
            current_refin = Date.parse(current['data_ocorrencia'])
            last_refin = Date.parse(last['data_ocorrencia'])
            return current if current_refin > last_refin

            last
          end

          @last_refin
        end

        def last_serasa_search_date(data)
          return nil unless data.any?
          first_hash = data.first.with_indifferent_access
          first_date = Date.new(first_hash[:ano_consulta] + 2000, first_hash[:mes_consulta], 1)
          @last_serasa_search ||= data.inject(first_date) do |fd, serasa_search|
            ocurrence = Date.new(serasa_search['ano_consulta'] + 2000, serasa_search['mes_consulta'], 1)
            return ocurrence if ocurrence > fd

            fd
          end
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

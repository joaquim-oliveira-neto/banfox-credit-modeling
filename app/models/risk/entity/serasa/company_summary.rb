module Risk
  module Entity
    module Serasa
      class CompanySummary < Risk::Entity::Base
        attr_accessor :count_searches_serasa, :count_company_searches,
                      :count_financial_company_search,
                      :pefin_count, :pefin_value, :pefin_last_ocurrence,
                      :refin_count, :refin_value, :refin_last_ocurrence,
                      :protest_count, :protest_value, :protest_last_ocurrence,
                      :judicial_action_count, :judicial_action_value, :judicial_action_last_ocurrence,
                      :bad_check_count, :bad_check_value, :bad_check_last_ocurrence
      end
    end
  end
end

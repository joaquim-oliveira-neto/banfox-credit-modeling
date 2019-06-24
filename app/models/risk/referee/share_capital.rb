module Risk
  module Referee
    class ShareCapital < Base
      def initialize(corporate_control)
        @corporate_control = corporate_control
        @code = ''
        @title = ''
        @description = ''
      end

      def call
        share_capital = @corporate_control.share_capital
        if share_capital < 10_000
          red!
        elsif share_capital >= 10_000 && share_capital < 50_000
          yellow!
        else
          green!
        end
      end
    end
  end
end

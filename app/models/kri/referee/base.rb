class KRI::Referee::Base

  RED_FLAG = -1
  YELLOW_FLAG = 1
  GREEN_FLAG = 0
  # Methods to create KRI with its respectives flags
  {
    red:    RED_FLAG,
    green:  GREEN_FLAG,
    yellow: YELLOW_FLAG
  }.each do |method, flag|
    define_method(:"#{method}!") do
      KeyRiskIdentifier.create(
        title: self.class.title,
        description: self.class.description,
        code: self.class.code,
        flag: flag
      )
    end
  end

  class << self
    attr_reader :code, :title, :description, :required_external_services

    def require_external_service(external_service)
      @required_external_services ||= []
      @required_external_services << external_service
    end

    def search_documents
      #TODO
    end

    def configure_identifier(**params)
      @code = params[:code] unless params[:code].nil?
      @title = params[:title] unless params[:title].nil?
      @description = params[:description] unless params[:description].nil?
    end

    def call(*args)
      if required_external_services.any?
        self.search_documents
      end
      new(*args).call
    end
  end
end

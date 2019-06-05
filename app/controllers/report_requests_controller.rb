class ReportRequestsController < ApplicationController
  def index
    @report_requests = ReportRequest.where(user: current_user)
                                    .includes(:company_report)
                                    .order(created_at: :desc)
                                    .paginate(page: params[:page], per_page: 30)
  end

  def new
    @report_request = ReportRequest.new
  end

  def create
    cnpj = report_request_params[:cnpj].gsub(/[^0-9]/, '')
    @report_request = ReportRequest.new(cnpj: cnpj, user: current_user)
    company_report = CompanyReport.new(cnpj: cnpj)
    company_report.fetch_data_from_nogord
    @report_request.company_report = company_report
    if @report_request.save
      redirect_to report_request_path(@report_request)
    else
      render :new
    end
  end

  def show
    report_request = ReportRequest.find(params[:id])
    report = report_request.company_report
    @cnpj = report.cnpj
    @basic_data = report.basic_data
    @addresses = report.addresses
    @processes_other = report.processes_other
    @processes_defendant = report.processes_defendant
    @processes_suitor = report.processes_suitor
    @relationships_overview = report.relationships_overview
    @relationships = report.relationships
    @activity_indicators = report.activity_indicators
    @domains = report.domains
    @emails = report.emails
    @phones = report.phones

    @basic_data ||= {}
    @activity_indicators ||= {}
    @relationships_overview ||= {}
  end

  private

  def report_request_params
    params.require(:report_request).permit(:cnpj)
  end
end

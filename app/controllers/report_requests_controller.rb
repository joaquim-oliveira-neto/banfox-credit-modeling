class ReportRequestsController < ApplicationController

  def index
    @report_requests = ReportRequest.where(user: current_user).includes(:company_report)
  end

  def new
    @report_request = ReportRequest.new
  end

  def create
    @report_request = ReportRequest.new(report_request_params)
    company_report = CompanyReport.new(cnpj: report_request_params[:cnpj])
    company_report.fetch_data_from_nogord
    @report_request.user = current_user
    @report_request.company_report = company_report
    @report_request.save!

    redirect_to report_request_path(@report_request)
  end

  def show
    report_request = ReportRequest.find(params[:id])
    report = report_request.company_report
    @basic_data = report.basic_data
    @addresses = report.addresses
    @processes_defendant = report.processes_defendant
    @processes_suitor = report.processes_suitor
    @relationships = report.relationships
    @activity_indicators = report.activity_indicators
    @domains = report.domains
    @emails = report.emails
    @phones = report.phones
  end

  private

  def report_request_params
    params.require(:report_request).permit(:cnpj)
  end
end

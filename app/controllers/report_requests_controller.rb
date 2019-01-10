class ReportRequestsController < ApplicationController
  def new
    @report_request = ReportRequest.new
  end

  def create
    @report_request = ReportRequest.new(report_request_params)
    @report_request.user = current_user
    @report_request.company_report = CompanyReport.new(cnpj: report_request_params[:cnpj])
    @report_request.save!

    redirect_to report_request_path(@report_request)
  end

  def show
    report_request = ReportRequest.find(params[:id])
    @data = report_request.company_report.data.to_s
  end

  private

  def report_request_params
    params.require(:report_request).permit(:cnpj)
  end
end

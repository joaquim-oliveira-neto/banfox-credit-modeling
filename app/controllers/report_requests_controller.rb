class ReportRequestsController < ApplicationController
  def new
    @report_request = ReportRequest.new
  end

  def create
    @report_request = ReportRequest.new(report_request_params)
    @report_request.user = current_user
    @report_request.save!
    redirect_to report_request_path(@report_request)
  end

  private

  private

  def report_request_params
    params.require(:report_request).permit(:cnpj)
  end
end

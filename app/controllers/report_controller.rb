class ReportController < ApplicationController
  def global
    @users = UserReportingDecorator.decorate_collection User.order(first_name: :asc)
    @reporting_months = reporting_months
  end

  private

  def requested_month
    month = params.fetch(:month, Date.today.month).to_i
    year = params.fetch(:year, Date.today.year).to_i
    Date.new(year, month, 1)
  rescue
    Date.today
  end

  def reporting_months
    Array.new(2) do |i|
      (requested_month - i.months)
    end.reverse
  end
end

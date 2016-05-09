class ReportController < ApplicationController
  def global
    @users = UserReportingDecorator.decorate_collection User.order(first_name: :asc)
    @reporting_months = reporting_months
    @reporting = reporting_months.map do |month|
      {
        orders: Order.where(created_at: month.beginning_of_month..month.end_of_month).sum(:price),
        payments: Payment.where(booked_at: month.beginning_of_month..month.end_of_month).sum(:amount)
      }
    end
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

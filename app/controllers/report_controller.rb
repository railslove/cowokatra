class ReportController < ApplicationController
  def global
    @users = UserReportingDecorator.decorate_collection User.order(first_name: :asc)
    @reporting_weeks = reporting_weeks
  end

  def current_cweek
    week = params.fetch(:week, Date.today.cweek).to_i
    year = params.fetch(:year, Date.today.year).to_i
    Date.commercial(year, week, 1)
  rescue
    Date.today.cweek
  end

  def reporting_weeks
    Array.new(3) do |i|
      (current_cweek - i.weeks)
    end.reverse
  end
end

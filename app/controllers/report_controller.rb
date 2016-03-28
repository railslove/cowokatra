class ReportController < ApplicationController
  def global
    @users = UserReportingDecorator.decorate_collection User.order(first_name: :asc)
  end
end

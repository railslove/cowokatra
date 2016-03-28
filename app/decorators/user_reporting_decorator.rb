class UserReportingDecorator < UserDecorator
  delegate_all

  def payments_total
    payments.sum(:amount)
  end

  def payments_by_week(week = Date.today.cweek, year = Date.today.year)
    payments.where(created_at: beginning_of_week(week, year)..end_of_week(week, year)).sum(:amount)
  end

  def orders_total
    order.sum(:price)
  end

  def orders_by_week(week = Date.today.cweek, year = Date.today.year)
    orders.where(created_at: beginning_of_week(week, year)..end_of_week(week, year)).sum(:price)
  end

  private

  def beginning_of_week(week, year)
    Date.commercial(year, week, 1)
  end

  def end_of_week(week, year)
    Date.commercial(year, week, 7)
  end
end

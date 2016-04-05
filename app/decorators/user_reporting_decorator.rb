class UserReportingDecorator < UserDecorator
  delegate_all

  def budget_by_month(report_date)
    payments_by_month(report_date) - orders_by_month(report_date)
  end

  def styled_budget_by_month(report_date)
    budget = budget_by_month(report_date)

    if budget != 0
      h.content_tag(:span, h.number_to_currency(budget), class: budget > 0 ? 'payment' : 'order')
    else
      h.content_tag(:span, '&ndash;'.html_safe)
    end
  end

  def payments_total
    payments.sum(:amount)
  end

  def orders_total
    order.sum(:price)
  end

  private

  def payments_by_month(report_date)
    payments.where(created_at: report_date.beginning_of_month..report_date.end_of_month).sum(:amount)
  end

  def orders_by_month(report_date)
    orders.where(created_at: report_date.beginning_of_month..report_date.end_of_month).sum(:price)
  end
end

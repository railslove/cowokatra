class UserDecorator < ApplicationDecorator
  delegate_all

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def gravatar_url
    gravatar_id = Digest::MD5.hexdigest(object.email.downcase)
    "//gravatar.com/avatar/#{gravatar_id}.png"
  end

  def calculated_budget
    object.budget - object.orders.sum(:price)
  end

  def initials
    "#{object.first_name.try(:first)}#{object.last_name.try(:first)}"
  end
end

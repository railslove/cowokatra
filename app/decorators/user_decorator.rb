class UserDecorator < ApplicationDecorator
  delegate_all

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def color
    Digest::MD5.hexdigest(object.first_name).first(6)
  end

  def user_image
    h.content_tag :div, class: 'user-image ', style: "background-color: ##{color}; background-image: url(#{avatar_url})" do
      yield if block_given?
    end
  end

  def calculated_budget
    object.payments.sum(:amount) - object.orders.sum(:price)
  end

  def avatar_url(size = 256)
    if object.avatar_url.present?
      avatar_url
    else
      "//gravatar.com/avatar/#{Digest::MD5.hexdigest(object.email)}?s=#{size}"
    end
  end
end

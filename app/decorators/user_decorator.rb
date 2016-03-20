class UserDecorator < ApplicationDecorator
  delegate_all

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def user_avatar(size)
    h.image_tag object.avatar_url, class: 'user-image'
  end

  def user_colored_box(size)
    color = Digest::MD5.hexdigest(object.first_name).first(6)

    h.content_tag :div, class: 'user-image as-default ', style: "background-color: ##{color}" do
      h.content_tag :div, class: 'user-image--default-name' do
        object.first_name
      end
    end
  end

  def user_image(size = '80x80')
    if object.avatar_url.present?
      user_avatar size
    else
      user_colored_box size
    end
  end

  def calculated_budget
    object.payments.sum(:amount) - object.orders.sum(:price)
  end
end

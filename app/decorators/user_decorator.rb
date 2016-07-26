class UserDecorator < ApplicationDecorator
  delegate_all

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def user_colored_box
    color = Digest::MD5.hexdigest(object.first_name).first(6)

    h.content_tag :div, class: 'user-image as-default ', style: "background-color: ##{color}" do
      h.content_tag :div, class: 'user-image--default-name' do
        object.first_name
      end
    end
  end

  def avatar_url(size = 256)
    if object.avatar_url.present?
      object.avatar_url
    else
      "https://gravatar.com/avatar/#{email_digest}?s=#{size}&d=#{robohash_fallback(size)}"
    end
  end

  def user_image
    h.image_tag(avatar_url, class: 'user-image')
  end

  def calculated_budget
    object.payments.sum(:amount) - object.orders.sum(:price)
  end

  def robohash_fallback(size = 256)
    "https://robohash.org/#{email_digest}?size=#{size}x#{size}"
  end

  def email_digest
    Digest::MD5.hexdigest(object.email)
  end
end


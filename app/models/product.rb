# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  slug       :string
#  name       :string
#  price      :decimal(6, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order      :integer          default("0")
#

class Product < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders

  scope :in_order, -> { order order: :asc }

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :init_slug

  private

  def init_slug
    self.slug = name.downcase.gsub(/\s/, '_')
    self.slug += Product.where(slug: slug).count.to_s if Product.where(slug: slug).exists?
  end
end

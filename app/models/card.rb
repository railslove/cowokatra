class Card < ActiveRecord::Base
  belongs_to :user

  validates :card_id, presence: true, uniqueness: true
end

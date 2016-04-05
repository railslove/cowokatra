# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  amount     :decimal(6, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  booked_at  :datetime
#

require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:subject) { create :payment }

  it { should belong_to :user }
  it { should validate_presence_of :amount }

  it { expect(subject.booked_at).to eq subject.created_at }
end

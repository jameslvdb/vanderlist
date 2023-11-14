# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "rails_helper"

RSpec.describe User, type: :model do
  it "enforces email uniqueness" do
    create(:user)
    user = build(:user)
    expect(user).to_not be_valid
  end
end

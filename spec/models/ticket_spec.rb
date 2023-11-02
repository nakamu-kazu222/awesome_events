require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, owner: user) }

  # 有効な属性であること
  it "is valid with valid attributes" do
    ticket = FactoryBot.build(:ticket, user: user, event: event)
    expect(ticket).to be_valid
  end

  # イベントがない場合は無効であること
  it "is not valid without an event" do
    ticket = FactoryBot.build(:ticket, user: user, event: nil)
    expect(ticket).not_to be_valid
  end

  # 最大30文字までのコメントが有効であること
  it "is valid with a comment up to 30 characters" do
    ticket = FactoryBot.build(:ticket, user: user, event: event, comment: "A" * 30)
    expect(ticket).to be_valid
  end

  # 30文字を超えるコメントは無効であること
  it "is not valid with a comment exceeding 30 characters" do
    ticket = FactoryBot.build(:ticket, user: user, event: event, comment: "A" * 31)
    expect(ticket).not_to be_valid
  end
end

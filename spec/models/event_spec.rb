require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { FactoryBot.create(:user) }

  # 有効な属性であること
  it "is valid with valid attributes" do
    event = FactoryBot.create(:event, owner: user)
    expect(event).to be_valid
  end

  # 名前がない場合は無効であること
  it "is not valid without a name" do
    event = FactoryBot.build(:event, name: nil)
    expect(event).to_not be_valid
  end

  # start_at が end_at より後の場合は無効であること
  it "is not valid when start_at is after end_at" do
    event = FactoryBot.build(:event,
      name: "Invalid Event",
      start_at: Time.now + 1.hour,
      end_at: Time.now
    )
    expect(event).to_not be_valid
  end

  # ユーザーによって作成された場合
  it "is created by a user" do
    event = FactoryBot.build(:event,
      name: "User's Event",
      place: "Example Place",
      content: "Example Content",
      owner: user
    )
    expect(event.created_by?(user)).to be_truthy
  end

  # イベントのデータが検索インデックスに含まれていること
  it "includes the event's data in the search index" do
    event = FactoryBot.create(:event,
      name: "Searchable Event",
      owner: user
    )
    events = Event.where("name LIKE ?", "%Searchable Event%")
    expect(events).to include(event)
  end
end

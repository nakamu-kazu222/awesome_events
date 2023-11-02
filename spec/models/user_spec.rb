require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  # 関連するイベントがない場合、ユーザーを削除できること
  it "destroys a user with no associated events" do
    user.destroy
    expect(User.count).to eq(0)
  end

  # ユーザーが作成したイベントがある場合、ユーザーを削除できないこと
  it "does not destroy a user with associated created events" do
    user = FactoryBot.create(:user)
    event = FactoryBot.create(:event, owner: user)

    # ユーザー削除前のイベント数を記録
    event_count = Event.count
    user.destroy

    expect(user.destroyed?).to be_truthy
    expect(Event.count).to eq(event_count)
    expect(event.reload.owner).to be_nil
  end

  # ユーザーが参加しているイベントがある場合、ユーザーを削除できないこと
  it "does not destroy a user with associated participating events" do
    user = FactoryBot.create(:user)
    event = FactoryBot.create(:event)
    ticket = FactoryBot.create(:ticket, user: user, event: event)

    # ユーザー削除前のチケット数を記録
    ticket_count = Ticket.count
    user.destroy

    expect(user.destroyed?).to be_truthy
    expect(Ticket.count).to eq(ticket_count)
    expect(ticket.reload.user).to be_nil
  end
end

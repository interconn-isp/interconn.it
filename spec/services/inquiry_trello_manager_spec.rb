require 'rails_helper'

RSpec.describe InquiryTrelloManager do
  subject { InquiryTrelloManager.new(list_id: 'DummyList') }

  let(:inquiry) { { code: 'FAKE', address: 'Fake Address', telephone: '0691820291', created_at: Time.now } }

  describe '#create_inquiry_card' do
    it 'creates the card' do
      Trello::Card.expects(:create).once
      subject.create_inquiry_card(inquiry)
    end
  end

  describe '#update_inquiry_card' do
    it "updates the card's description" do
      card = mock()
      card.expects(:desc=).once
      card.expects(:update!).once

      Trello::Card.expects(:find).with('FakeCardID').once.returns(card)

      subject.update_inquiry_card('FakeCardID', inquiry)
    end
  end
end

require 'rails_helper'

RSpec.describe InquiryTrelloManager do
  subject { InquiryTrelloManager.new(list_id: 'DummyList') }

  let(:inquiry) { { code: 'FAKE', address: 'Fake Address', telephone: '0691820291', created_at: Time.now } }

  describe '#create_inquiry_card' do
    it 'creates the card' do
      expected_desc = "- Codice richiesta: **#{inquiry[:code]}**\n"
      expected_desc += "- Indirizzo: **#{inquiry[:address]}**\n"
      expected_desc += "- Telefono: **#{inquiry[:telephone]}**\n"
      expected_desc += "- Data invio: **#{inquiry[:created_at].strftime('%d/%m/%Y %H:%M')}**"

      Trello::Card.expects(:create)
        .once
        .with(name: inquiry[:address], desc: expected_desc, list_id: 'DummyList')
        .returns(true)

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

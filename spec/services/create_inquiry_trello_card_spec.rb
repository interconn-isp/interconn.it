require 'rails_helper'

RSpec.describe CreateInquiryTrelloCard do
  subject { CreateInquiryTrelloCard.new(list_id: 'DummyList') }

  describe '#create_inquiry_card' do
    let(:inquiry) { { code: 'FAKE', address: 'Fake Address', telephone: '0691820291', created_at: Time.now } }

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
end

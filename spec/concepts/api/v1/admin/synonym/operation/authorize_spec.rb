require 'rails_helper'

RSpec.describe Api::V1::Admin::Synonym::Operation::Authorize do
  let(:synonym) { create(:synonym) }
  let(:id) { synonym.id }
  let(:params) do
    {
      id:
    }
  end
  let(:operation) { described_class.call(params:) }

  let(:model) { operation[:model] }

  context 'when synonym is authorized' do
    it { expect(operation.success?).to be true }
    it { expect(model.status).to eq('authorize') }
    it { expect(model.authorize?).to be true }
  end

  context 'when synonym not found' do
    let(:id) { Faker::Internet.uuid }

    it { expect(operation.success?).to be false }
    it { expect(model).to be nil }
  end

  context 'when synonym previously was authorized' do
    let(:synonym) { create(:synonym, status: :authorize) }

    it { expect(operation.success?).to be false }
    it { expect(model).to be nil }
  end
end

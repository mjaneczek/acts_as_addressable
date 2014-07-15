describe ActsAsAddressable::Addressable do
  let(:active_record_model) { Company.create! name: 'test_company' }

  it 'check if method is included' do
    expect(Company).to respond_to(:acts_as_addressable)
  end

  context 'addressable company' do
    before(:all) do
      Company.acts_as_addressable
    end

    it 'checks company addresses' do
      expect(active_record_model.addresses).to eq Address.none
    end

    it 'creates company address' do
      expect do
        active_record_model.addresses.create!
      end.to change{active_record_model.addresses.count}.by(1)
    end
  end
end

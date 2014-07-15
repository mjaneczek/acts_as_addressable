describe ActsAsAddressable::Addressable do
  let(:company) { Company.create! name: 'test_company' }

  it 'check if method is included' do
    expect(Company).to respond_to(:acts_as_addressable)
  end

  context 'addressable company without address type' do
    before(:all) do
      Company.acts_as_addressable
    end

    it 'checks company addresses' do
      expect(company.addresses).to eq Address.none
    end

    it 'creates company address' do
      expect do
        company.addresses.create!
      end.to change{company.addresses.count}.by(1)
    end
  end

  context 'addressable company with address type' do
    before(:all) do
      Company.acts_as_addressable :real, :fake
    end

    it 'checks relations' do
      [:real_addresses, :fake_addresses].each do |relation|
        expect(company.send(relation)).to eq Address.none
      end
    end

    it 'create address with type' do
      Address.create! addressable: company, type: 'FakeAddress'

      expect(company.real_addresses).to eq Address.none
      expect(company.fake_addresses).to eq [Address.last]
    end

    it 'create address without type' do
      Address.create! addressable: company

      expect(company.addresses).to eq [Address.last]
      expect(company.real_addresses + company.fake_addresses).to eq Address.none
    end
  end
end

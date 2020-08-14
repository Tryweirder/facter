# frozen_string_literal: true

describe Facts::Freebsd::ZfsVersion do
  describe '#call_the_resolver' do
    subject(:fact) { Facts::Freebsd::ZfsVersion.new }

    let(:version) { '6' }

    before do
      allow(Facter::Resolvers::ZFS).to receive(:resolve).with(:zfs_version).and_return(version)
    end

    it 'calls Facter::Resolvers::ZFS' do
      fact.call_the_resolver
      expect(Facter::Resolvers::ZFS).to have_received(:resolve).with(:zfs_version)
    end

    it 'returns zfs_version fact' do
      expect(fact.call_the_resolver).to be_an_instance_of(Facter::ResolvedFact).and \
        have_attributes(name: 'zfs_version', value: version)
    end
  end
end

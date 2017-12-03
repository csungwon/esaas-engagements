require 'rails_helper'

describe User do
    #Story ID: #153069725
    describe 'User associations' do

        it 'belongs to a coaching org' do
            assc = described_class.reflect_on_association(:coaching_org)
            expect(assc.macro).to eq :belongs_to
        end
        
        it 'belongs to a developing_engagement' do
            assc = described_class.reflect_on_association(:developing_engagement)
            expect(assc.macro).to eq :belongs_to

        end
        
        it 'has many comments' do
            assc = described_class.reflect_on_association(:comments)
            expect(assc.macro).to eq :has_many
        end
        
        it 'has many client orgs' do
            assc = described_class.reflect_on_association(:client_orgs)
            expect(assc.macro).to eq :has_many
        end
        
        it 'has many coaching engagements' do
            assc = described_class.reflect_on_association(:coaching_engagements)
            expect(assc.macro).to eq :has_many
        end
        
        it 'has many apps' do
            assc = described_class.reflect_on_association(:apps)
            expect(assc.macro).to eq :has_many
        end
        
        it 'has many client engagements' do
            assc = described_class.reflect_on_association(:client_engagements)
            expect(assc.macro).to eq :has_many
        end

    end

end
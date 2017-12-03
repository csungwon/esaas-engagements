require 'rails_helper'

describe Engagement do
    #Story ID: #153069725
    describe 'engagement associations' do

        it 'belongs to an app' do
            assc = described_class.reflect_on_association(:app)
            expect(assc.macro).to eq :belongs_to

        end
        
        it 'belongs to a coach' do
            assc = described_class.reflect_on_association(:coach)
            expect(assc.macro).to eq :belongs_to
        end
        
        it 'has one coaching org' do
            assc = described_class.reflect_on_association(:coaching_org)
            expect(assc.macro).to eq :has_one

        end
        
        it 'has one client org' do
            assc = described_class.reflect_on_association(:client_org)
            expect(assc.macro).to eq :has_one

        end
        
        it 'has one client' do
            assc = described_class.reflect_on_association(:client)
            expect(assc.macro).to eq :has_one

        end
        
        it 'has many iterations' do
            assc = described_class.reflect_on_association(:iterations)
            expect(assc.macro).to eq :has_many

        end
        
        it 'has many developers' do
            assc = described_class.reflect_on_association(:developers)
            expect(assc.macro).to eq :has_many
        end

    end
    

end
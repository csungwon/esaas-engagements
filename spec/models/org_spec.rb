require 'rails_helper'

describe Org do
    #Story ID: #153069725
    describe 'org associations' do
        
        it 'has many apps' do
            assc = described_class.reflect_on_association(:apps)
            expect(assc.macro).to eq :has_many
        
        end

        it 'has many comments' do
            assc = described_class.reflect_on_association(:comments)
            expect(assc.macro).to eq :has_many
        
        end

        it 'has many coaches' do
            assc = described_class.reflect_on_association(:coaches)
            expect(assc.macro).to eq :has_many
        
        end

    end
    
    describe 'address' do

        
        it 'gives full address' do
            user1 = User.create(:name => 'person', :email => 'fake@fake.com' )
            org1 = Org.new(:name => 'is org', :contact => user1)
            org1.address_line_1 = "A"
            org1.address_line_2 = "Happy"
            org1.city_state_zip = "Place Number 66"
            expect(org1.address).to eq ("A Happy Place Number 66")

        end

    end



end
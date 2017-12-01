require 'rails_helper'

describe Org do
	describe 'prints out address of an organization' do
		it 'prints out an address with all information' do
			@org = FactoryGirl.build(:org, :address_line_1 => '222 Bancroft St.',
				:address_line_2 => 'P.O. BOX 123', :city_state_zip => 'Berkeley, CA 94704')
			expect(@org.address).to eq "222 Bancroft St., P.O. BOX 123, Berkeley, CA 94704"
		end
		it 'prints out an address if one information is not given' do
			@org = FactoryGirl.build(:org, :address_line_1 => '1231 University Ave.',
				:address_line_2 => nil, :city_state_zip => 'Berkeley, CA 94703')
			expect(@org.address).to eq '1231 University Ave., Berkeley, CA 94703'
		end
		it 'prints out an address if no information is given' do
			@org = Org.create(name: 'CS169', contact_id: 2)
			expect(@org.address).to eq ''
		end
	end
end
require 'rails_helper'

describe Engagement do
    #Story ID: #153069725
    describe 'should belong to a coach and contact', :pending => true do

        it 'belongs to a coach', :pending => true do
            pending("work") do
                expect(1).to eq(1)
                # @user1 = User.new
                # @user2 = User.new
                # @eng = Engagement.new
                # @eng.coach = @user1
                # expect(@eng.coach).to eq(@user1)
            end
        end

        it 'belongs to a client', :pending => true do
            pending("work") do
                expect(1).to eq(1)
                # @user1 = User.new
                # @user2 = User.new
                # @eng = Engagement.new
                # @eng.coach = @user2
                # expect(@eng.contact).to eq(@user2)
            end
        end

    end

    #Story ID: #153069725
    describe 'should have some number of developers', :pending => true do

        it "has many developers", :pending => true do
            pending("work") do
                expect(1).to eq(1)
                # @user1 = User.new
                # @user2 = User.new
                # @eng = Engagement.new
                # @eng.developers << [@user1, @user2]
                # expect(@eng.developers).to eq([@user1, @user2])
            end
        end

    end

end
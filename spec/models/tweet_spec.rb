require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end
  
  describe 'tweet投稿' do

    context '投稿が上手くいく時' do

      it 'title.textが入力されている' do
        expect(@tweet).to be_valid
      end
    end

    context '投稿が上手くいかない時' do

      it 'titleが空の時' do
        @tweet.title = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end 
      
      it 'textが空の時' do
        @tweet.text = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end

    end 

  end
end

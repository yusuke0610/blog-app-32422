require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
   @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do

   context 'コメントの登録がうまく行く時' do

    it 'commentが入力されている' do
      expect(@comment).to be_valid
    end

   end 

   context 'コメントが入力されていない時' do
     @comment.commnet = ""
     binding.pry
     @commnet.valid?
     expect(@comment.errors.full_messages).to include()
   end

  end

end

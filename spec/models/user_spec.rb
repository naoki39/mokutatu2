require 'rails_helper'#rails_helper.rb（テストをする時に共通に設定を書いておくファイル）を読み込む記述

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nicknameを入力してください")
    end
    it 'emailが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Emailを入力してください")
    end
    it 'passwordが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Passwordを入力してください")
    end
    it 'goalが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.goal = ''
      user.valid?
      expect(user.errors.full_messages).to include("Goalを入力してください")
    end
    it 'second_goalが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.second_goal = ''
      user.valid?
      expect(user.errors.full_messages).to include("Second goalを入力してください")
    end
    it 'to_doが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.to_do = ''
      user.valid?
      expect(user.errors.full_messages).to include("To doを入力してください")
    end
    it 'imageが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.image = ''
      user.valid?
      expect(user.errors.full_messages).to include("Imageを入力してください")
    end
  end
end

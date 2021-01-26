require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
    end
    context '実際に保存してみる' do
      it "有効なフォーム内容の場合は保存されるか" do
        expect(@user).to be_valid
      end
    end
    context 'nameカラムに関するバリデーション' do
      it '空白でないこと' do
        @user.name = ""
        expect(@user).to be_invalid
      end
      it '2文字以上であること:1文字はNG' do
        @user.name = Faker::Lorem.characters(number:1)
        expect(@user).to be_invalid
      end
      it '2文字以上であること:2文字はOK' do
        @user.name = Faker::Lorem.characters(number:2)
        expect(@user).to be_valid
        # is_expected.to eq true
      end
      it '20文字以下であること:21文字はNG' do
        @user.name = Faker::Lorem.characters(number:21)
        expect(@user).to be_invalid
        # is_expected.to eq false
      end
      it '20文字以下であること:20文字はOK' do
        @user.name = Faker::Lorem.characters(number:20)
        expect(@user).to be_valid
        # is_expected.to eq true
      end
    end
    context 'introductioカラムに関するバリデーション' do
      it '50文字以下であること:51文字はNG' do
        @user.introduction = Faker::Lorem.characters(number:51)
        expect(@user).to be_invalid
        # is_expected.to eq false
      end
      it '50文字以下であること:50文字はOK' do
        @user.introduction = Faker::Lorem.characters(number:50)
        expect(@user).to be_valid
        # is_expected.to eq true
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'PostImageモデルとの関係' do
      it '1:Nの関係になっている' do
        expect(User.reflect_on_association(:post_images).macro).to eq :has_many
      end
    end
  end
end


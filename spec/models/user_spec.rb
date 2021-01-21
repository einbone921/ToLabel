# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe User, "モデルに関するテスト", type: :model do
#   describe '実際に保存してみる' do
#     it "有効なフォーム内容の場合は保存されるか" do
#       expect(FactoryBot.build(:user)).to be_valid
#     end
#   end
#   context "空白のバリデーションチェック"
# end

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) {create(:user)}
    let(:user) {build(:user)}

    context 'nameカラム' do
      it '空白でないこと' do
        user.name = ""
        is_expected.to eq false
      end
      it '2文字以上であること:1文字はNG' do
        user.name = Faker::Lorem.characters(number:1)
        is_expected.to eq false
      end
      it '2文字以上であること:2文字はOK' do
        user.name = Faker::Lorem.characters(number:2)
        is_expected.to eq true
      end
      it '20文字以下であること:21文字はNG' do
        user.name = Faker::Lorem.characters(number:21)
        is_expected.to eq false
      end
      it '20文字以下であること:20文字はOK' do
        user.name = Faker::Lorem.characters(number:20)
        is_expected.to eq true
      end
    end

    context 'introductioカラム' do
      it '50文字以下であること:50文字はOK' do
        user.introduction = Faker::Lorem.characters(number:50)
        is_expected.to eq true
      end
      it '50文字以下であること:51文字はNG' do
        user.introduction = Faker::Lorem.characters(number:51)
        is_expected.to eq false
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


# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効なフォーム内容の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
end


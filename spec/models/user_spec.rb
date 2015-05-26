# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe User, type: :model do

  context "パスワードが３文字以上のときは" do
    it "有効" do
      user = Fg.build(:user, password: "123", password_confirmation: "123")
      expect(user).to be_valid
    end
  end

  context "パスワードが３文字未満のときは" do
    it "無効" do
      user = Fg.build(:user, password: "12", password_confirmation: "12")
      expect(user).not_to be_valid
    end
  end

  context "パスワードと確認パスワードが違うときは" do
    it "無効" do
      user = Fg.build(:user, password: "123", password_confirmation: "124")
      expect(user).not_to be_valid
    end
  end

  context "パラメーターが有効なときは" do
    it "有効" do
      user = Fg.build(:user)
      expect(user).to be_valid
    end
  end

  context "パラメーターが無効なとき" do
    it "emailが無効なら無効" do
      user = Fg.build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it "passswordが無効なら無効" do
      user = Fg.build(:user, password: nil)
      expect(user).not_to be_valid
    end

    it "passsword_confirmationが無効なら無効" do
      user = Fg.build(:user, password_confirmation: nil)
      expect(user).not_to be_valid
    end
  end

  context "重複したemail addressがあるときは" do
    it "弾く" do
      Fg.create(:user, email: "hoge@example.com")
      user = Fg.build(:user, email: "hoge@example.com")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
end

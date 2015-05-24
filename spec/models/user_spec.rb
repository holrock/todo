# -*- coding: utf-8 -*-
require 'rails_helper'

Fg = FactoryGirl

RSpec.describe User, type: :model do

  context "パスワードが３文字以上のときは" do
    it "有効であるべき" do
      user = Fg.build(:user, password: "123", password_confirmation: "123")
      expect(user).to be_valid
    end
  end

  context "パスワードが３文字未満のときは" do
    it "無効であるべき" do
      user = Fg.build(:user, password: "ab", password_confirmation: "ab")
      expect(user).not_to be_valid
    end
  end

  context "パスワードと確認パスワードが違うときは" do
    it "無効であるべき" do
      user = Fg.build(:user, password: "123", password_confirmation: "124")
      expect(user).not_to be_valid
    end
  end

  context "重複したemail addressがあるときは" do
    it "弾くべき" do
      Fg.create(:user, email: "hoge@example.com")
      user = Fg.build(:user, email: "hoge@example.com")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
end

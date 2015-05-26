# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe TodoList, type: :model do

  context "パラメーターが有効なら" do
    it "有効" do
      list = Fg.build(:todo_list)
      expect(list).to be_valid
    end
  end

  context "パラメーターが無効なら" do
    it "無効" do
      list = Fg.build(:todo_list, title: nil)
      expect(list).not_to be_valid
    end
  end

  describe "with_user検索時" do
    it "同一ユーザーだけ返す" do
      f1 = Fg.create(:todo_list)
      f2 = Fg.create(:todo_list, user:f1.user)
      Fg.create(:todo_list)

      lists = TodoList.with_user(f1.user)
      expect(lists).to match_array([f1, f2])
    end
  end
end

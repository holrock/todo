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
end

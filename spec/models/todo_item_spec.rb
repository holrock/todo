# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  describe "生成" do
    context "パラメーターが有効" do
      it "有効" do
        item = Fg.build(:todo_item)
        expect(item).to be_valid
      end
    end

    context "パラメーターが無効" do
      it "無効" do
        item = Fg.build(:todo_item, text:nil)
        expect(item).not_to be_valid
      end
    end

  end
end

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

  describe "tagging" do
    context "include tag" do
      it "create tag" do
        item = Fg.build(:todo_item, text:"#tag1 #tag2")
        expect {
          item.save
        }.to change(Tag, :count).by(2)
      end

      it "pick tag string" do
        item = Fg.build(:todo_item, text:"#tag1 #tag2")
        item.save
        expect(item.tags.map(&:text)).to match(["tag1", "tag2"])
      end

      it "drop tag" do
        item = Fg.build(:todo_item, text:"#tag")
        item.save
        item.text = "empty"
        expect {
          item.save
        }.to change(Tag, :count).by(0)
      end
    end

    context "search by tag" do
      it "retrun taggin item" do
        item = Fg.create(:todo_item, text:"#tag1")
        Fg.create(:todo_item, text:"#tag2")
        items = TodoItem.search_by_tag("tag1")
        expect(items.to_a).to match([item])
      end
    end
  end
end



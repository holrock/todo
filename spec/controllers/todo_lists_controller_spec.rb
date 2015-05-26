# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe TodoListsController, type: :controller do
  describe "GET #list" do

    context "logined" do
      before :each do
        @user = Fg.create(:user)
        login_user(@user)
      end

      it "list todo" do
        @user.todo_items.create(Fg.attributes_for(:todo_item))
        get :list
        expect(assigns(:todo_items)).to match([@user.todo_items.first])
      end

      it "order by updated_at" do
        @user.todo_items.create(Fg.attributes_for(:todo_item, text:'1'))
        @user.todo_items.create(Fg.attributes_for(:todo_item, text:'2'))
        @user.todo_items.create(Fg.attributes_for(:todo_item, text:'3'))
        get :list
        desc_sorted = @user.todo_items.sort {|a, b| b.updated_at <=> a.updated_at}
        expect(assigns(:todo_items)).to match(desc_sorted)
      end

      it "render list" do
        get :list
        expect(response).to render_template("list")
      end
    end

    context "no login" do
      it "redirect to login page" do
        get :list
        expect(response).to redirect_to(login_path)
      end
    end
  end
end

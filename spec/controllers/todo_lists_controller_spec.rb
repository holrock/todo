# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe TodoListsController, type: :controller do
  describe "GET #list" do
    context "logined" do
      before :each do
        @user = Fg.create(:user)
        login_user(@user)
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

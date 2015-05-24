# -*- coding: utf-8 -*-
require 'rails_helper'

Fg = FactoryGirl

RSpec.describe UserSessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    context "存在するemailとpasswordがpostされたら" do
      it "loginが成功するべき" do
        user = Fg.create(:user, password: "123")
        post :create, email: user.email, password:"123"
        expect(logged_in?).to be(true)
      end
    end

    context "parameterが不正なとき" do
      it "emailがなければloginは失敗するべき" do
        user = Fg.create(:user, password: "123")
        post :create, email: nil, password:"123"
        expect(logged_in?).to be(false)
      end

      it "passwordがなければloginは失敗するべき" do
        user = Fg.create(:user)
        post :create, password:nil
        expect(logged_in?).to be(false)
      end

    end
  end

  describe "GET #destroy" do
    context "loginしていたら" do
      it "logoutするべき" do
        user = Fg.create(:user)
        login_user(user)
        get :destroy
        expect(logged_in?).to be(false)
      end
    end
  end
end

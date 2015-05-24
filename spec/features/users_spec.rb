# -*- coding: utf-8 -*-
require 'rails_helper'

feature do
  scenario "ユーザー新規作成" do
    visit root_path
    expect {
      click_link "Register"
      fill_in "user_email", with: "hoge@example.com"
      fill_in "user_password", with: "pass"
      fill_in "user_password_confirmation", with: "pass"
      click_button "Create User"
    }.to change(User, :count).by(1)n
    expect(current_path).to eq login_path
  end
end

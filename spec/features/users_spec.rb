# -*- coding: utf-8 -*-
require 'rails_helper'

feature do
  scenario "register" do
    visit root_path
    expect {
      click_link "Register"
      fill_in "user_email", with: "hoge@example.com"
      fill_in "user_password", with: "pass"
      fill_in "user_password_confirmation", with: "pass"
      click_button "Create User"
    }.to change(User, :count).by(1)
    expect(current_path).to eq login_path

    fill_in "email", with: "hoge@example.com"
    fill_in "password", with: "pass"
    click_button "Login"
    expect(current_path).to eq todo_path
  end

  scenario "login" do
    Fg.create(:user, email:"hoge@example.com", password:"pass")

    visit root_path
    click_link "Login"
    fill_in "email", with: "hoge@example.com"
    fill_in "password", with: "pass"
    click_button "Login"
    expect(current_path).to eq todo_path
  end

end

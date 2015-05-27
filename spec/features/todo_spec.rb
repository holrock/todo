# -*- coding: utf-8 -*-
require 'rails_helper'

feature do
  before :each do
    user = Fg.create(:user, password:'hoge')
    login(user, 'hoge')
    visit todo_url

  end

  scenario "create todo" do
    expect {
      fill_in "new todo", with: "todo1 #tag1"
      click_button "add"
    }.to change(TodoItem, :count).by(1)

    expect(current_path).to eq todo_path
    expect(page).to have_content "#tag1"
  end

  scenario "search tag" do
    fill_in "new todo", with: "todo1 #tag1"
    click_button "add"
    fill_in "new todo", with: "todo1 #tag2"
    click_button "add"
    first('li > a').click
    expect(current_path).to eq todo_path
    expect(page).not_to have_content "#tag1"
    expect(page).to have_content "#tag2"

    click_link("clear tag search")
    expect(page).to have_content "#tag1"
    expect(page).to have_content "#tag2"
  end
end

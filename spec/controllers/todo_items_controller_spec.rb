require 'rails_helper'


RSpec.describe TodoItemsController, type: :controller do

  let(:valid_attributes) { {todo_list_id: @todo_list.id, text:"text"} }

  let(:invalid_attributes) { {text:nil} }

  let(:valid_session) { {} }

  before :each do
    @user = Fg.create(:user)
    login_user(@user)
    @todo_list = Fg.create(:todo_list, user_id: @user_id)
  end

  describe "GET #index" do
    it "assigns all todo_items as @todo_items" do
      todo_item = TodoItem.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:todo_items)).to eq([todo_item])
    end
  end

  describe "GET #show" do
    it "assigns the requested todo_item as @todo_item" do
      todo_item = TodoItem.create! valid_attributes
      get :show, {:id => todo_item.to_param}, valid_session
      expect(assigns(:todo_item)).to eq(todo_item)
    end
  end

  describe "GET #new" do
    it "assigns a new todo_item as @todo_item" do
      get :new, {}, valid_session
      expect(assigns(:todo_item)).to be_a_new(TodoItem)
    end
  end

  describe "GET #edit" do
    it "assigns the requested todo_item as @todo_item" do
      todo_item = TodoItem.create! valid_attributes
      get :edit, {:id => todo_item.to_param}, valid_session
      expect(assigns(:todo_item)).to eq(todo_item)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new TodoItem" do
        expect {
          post :create, {:todo_item => valid_attributes}, valid_session
        }.to change(TodoItem, :count).by(1)
      end

      it "assigns a newly created todo_item as @todo_item" do
        post :create, {:todo_item => valid_attributes}, valid_session
        expect(assigns(:todo_item)).to be_a(TodoItem)
        expect(assigns(:todo_item)).to be_persisted
      end

      it "redirects to the created todo_item" do
        post :create, {:todo_item => valid_attributes}, valid_session
        expect(response).to redirect_to(TodoItem.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved todo_item as @todo_item" do
        post :create, {:todo_item => invalid_attributes}, valid_session
        expect(assigns(:todo_item)).to be_a_new(TodoItem)
      end

      it "re-renders the 'new' template" do
        post :create, {:todo_item => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {text:"new_text"}
      }

      it "updates the requested todo_item" do
        todo_item = TodoItem.create! valid_attributes
        put :update, {:id => todo_item.to_param, :todo_item => new_attributes}, valid_session
        todo_item.reload
        expect(todo_item.text).to eq("new_text")
      end

      it "assigns the requested todo_item as @todo_item" do
        todo_item = TodoItem.create! valid_attributes
        put :update, {:id => todo_item.to_param, :todo_item => valid_attributes}, valid_session
        expect(assigns(:todo_item)).to eq(todo_item)
      end

      it "redirects to the todo_item" do
        todo_item = TodoItem.create! valid_attributes
        put :update, {:id => todo_item.to_param, :todo_item => valid_attributes}, valid_session
        expect(response).to redirect_to(todo_item)
      end
    end

    context "with invalid params" do
      it "assigns the todo_item as @todo_item" do
        todo_item = TodoItem.create! valid_attributes
        put :update, {:id => todo_item.to_param, :todo_item => invalid_attributes}, valid_session
        expect(assigns(:todo_item)).to eq(todo_item)
      end

      it "re-renders the 'edit' template" do
        todo_item = TodoItem.create! valid_attributes
        put :update, {:id => todo_item.to_param, :todo_item => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested todo_item" do
      todo_item = TodoItem.create! valid_attributes
      expect {
        delete :destroy, {:id => todo_item.to_param}, valid_session
      }.to change(TodoItem, :count).by(-1)
    end

    it "redirects to the todo_items list" do
      todo_item = TodoItem.create! valid_attributes
      delete :destroy, {:id => todo_item.to_param}, valid_session
      expect(response).to redirect_to(todo_items_url)
    end
  end

end

require 'rails_helper'

Fg ||= FactoryGirl

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "assigns all users as @users" do
      user = Fg.create(:user)
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    before :each do
      @user = Fg.create(:user)
    end

    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, user: Fg.attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, user: Fg.attributes_for(:user)
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, user: Fg.attributes_for(:user)
        expect(response).to redirect_to(User)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, user: Fg.attributes_for(:user, email:nil)
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, user: Fg.attributes_for(:user, email:nil)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    context "logined" do
      before :each do
        @user = Fg.create(:user)
        login_user @user
      end

      context "with valid params" do
        it "updates the requested user" do
          new_email = @user.email + ".new"

          patch :update, id: @user,
            user: Fg.attributes_for(:user, email: new_email)

          @user.reload
          expect(@user.email).to eq(new_email)
        end

        it "assigns the requested user as @user" do
          patch :update, id: @user, user: Fg.attributes_for(:user)
          expect(assigns(:user)).to eq(@user)
        end

        it "redirects to the user" do
          patch :update, id: @user, user: Fg.attributes_for(:user)
          expect(response).to redirect_to(users_path)
        end
      end

      context "with invalid params" do
        it "assigns the user as @user" do
          patch :update, id: @user, user: Fg.attributes_for(:user, email: nil)
          expect(assigns(:user)).to eq(@user)
        end

        it "re-renders the 'edit' template" do
          patch :update, id: @user, user: Fg.attributes_for(:user, email: nil)
          expect(response).to render_template("edit")
        end
      end
    end

    context "no login" do
      before :each do
        @user = Fg.create(:user)
      end

      it "never updates the requested user" do
        old_email = @user.email
        new_email = @user.email + ".new"
        expect {
          patch :update, id: @user,
            user: Fg.attributes_for(:user, email: new_email)
          @user.reload
        }.not_to change(@user, :email)
      end

      it "return requrie login messge" do
        patch :update, id: @user, user: Fg.attributes_for(:user)
        expect(flash[:alert]).to eq("Please login first")
      end
    end
  end

  describe "DELETE #destroy" do
    context "logined" do
      before :each do
        @user = Fg.create(:user)
        login_user @user
      end

      it "destroys the requested user" do
        expect {
          delete :destroy, id: @user
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        delete :destroy, id: @user
        expect(response).to redirect_to(users_url)
      end
    end

    context "no login" do
      before :each do
        @user = Fg.create(:user)
      end

      it "never destroys the requested user" do
        expect {
          delete :destroy, id: @user
        }.not_to change(User, :count)
      end

      it "redirects to the users list" do
        delete :destroy, id: @user
        expect(response).to redirect_to(login_url)
      end
    end
  end
end

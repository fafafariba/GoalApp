require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do

    context 'with valid params' do

      it 'logs in user and displays username and log out button' do
        post :create, user: {username: 'username', password: 'password'}
        expect(response).not_to render_template(:new)
      end

    context 'with invalid params' do

      it 'renders sign up page and shows errors' do
        post :create, user: {username: 'username', password: 'passw'}

        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
   end
  end
end

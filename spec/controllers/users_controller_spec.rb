require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
    context 'get index' do
       it 'renders the index template' do
          get :index
          expect(response).to render_template(:index)
       end
       it 'assigns @posts' do
          user1 = User.create(name:'user1', email: 'user1@gmail.com')
          user2 = User.create(name:'user2', email: 'user2@gmail.com')
          users = [ user1, user2 ]
          get :index
          expect(assigns(:users)).to eq(users)
       end
    end
    
    context 'get show' do
       it 'renders the show template' do
           User.create(name: "User", email: "user@email.com")
          get :show, { id: 1 }
          expect(response).to render_template(:show)
       end
       
       context 'with valid id' do
           it 'assigns a user with that id to @user' do
                3.times do |n|
                   User.create(name: "User#{n}", email: "user#{n}@email.com") 
                end
                get :show, { id: 2 }
                expect(assigns(:user)).to eq(User.find(2))
           end
       end
    end
end

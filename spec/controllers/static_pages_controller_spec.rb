require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do
    describe 'GET about' do
       it 'renders the about template' do
          get :about
          expect(response).to render_template :about
       end
    end
    
    describe 'GET welcome' do
       it 'renders the welcome template' do
          get :welcome
          expect(response).to render_template :welcome
       end
    end
    
    describe 'GET contact' do
       it 'renders the about template' do
          get :contact
          expect(response).to render_template :contact
       end
    end
end

require 'rails_helper'

# main_app helpers
def main_app
  Rails.application.class.routes.url_helpers
end

RSpec.describe SimplyPages::PagesController do

  routes { SimplyPages::Engine.routes }
  describe 'PUT #update' do

    context 'without a logged in user' do
      it 'renders a redirect to login' do
        page = SimplyPages::Page.create(title: 'Test', content: '<h1>Hello World!</h1>')
        session[:user] = nil
        put :update, id: page.id, page: {title: 'Test Successful'}
        expect(response).to redirect_to(SimplyPages.redirection_url)
      end
    end

    context 'with a logged in user' do
      it 'allows a page update and redirects to pages#index' do
        page = SimplyPages::Page.create(title: 'Test', content: '<h1>Hello World!</h1>')
        @user = User.new
        @user.admin(true)
        session[:user] = @user
        put :update, id: page.id, page: {title: 'Test Successful'}
        expect(response).to redirect_to('/simply_pages/pages')
        page.reload
        expect(page.title).to eql('Test Successful')
      end
    end
  end
end

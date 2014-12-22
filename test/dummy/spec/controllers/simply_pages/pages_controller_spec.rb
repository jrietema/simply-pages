require 'rails_helper'

RSpec.describe SimplyPages::PagesController do
  describe 'PUT #update' do
    context 'without a logged in user' do
      it 'renders a redirect to login' do
        page = SimplyPages::Page.create(title: 'Test', content: '<h1>Hello World!</h1>')
        put :update, {use_route: :simply_pages, id: page.id, page: {title: 'Test Successful'}}, {user: nil}
        expect(response).to redirect_to(SimplyPages.redirection_url)
      end
    end

    context 'with a logged in user' do
      it 'allows a page update and redirects to pages#index' do
        page = SimplyPages::Page.create(title: 'Test', content: '<h1>Hello World!</h1>')
        user = User.new
        user.admin(true)
        put :update, {use_route: :simply_pages, id: page.id, page: {title: 'Test Successful'}}, {user: user}
        expect(response).to redirect_to('/simply_pages/pages')
        page.reload
        expect(page.title).to eql('Test Successful')
      end
    end
  end
end

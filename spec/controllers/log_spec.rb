require 'rails_helper'

RSpec.describe LogsController, type: :controller do
  describe 'GET #index' do
    before do
      User.create(name: 'aye')
      session[:author_id] = 1
      get :index
    end
    it { should_not render_template('individual') }
  end
  describe 'GET #individual' do
    before do
      User.create(name: 'aye')
      session[:author_id] = 1
      get :external
    end
  end
  describe 'GET #new' do
    before { get :new }
    it { should redirect_to(login_path) }
  end
  describe 'Post #create' do
    before do
      User.create(name: 'aye')
      session[:author_id] = 1
    end
  end
end

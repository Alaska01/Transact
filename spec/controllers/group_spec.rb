require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'GET #index' do
    before do
      User.create(name: 'aye')
      session[:author_id] = 1
      get :index
    end
    it { should render_template('index') }
    it { should_not render_template('show') }
  end

  it 'routes /groups/new to groups#new' do
    expect(get: '/groups/new').to route_to(
      controller: 'groups',
      action: 'new'
    )
  end
end

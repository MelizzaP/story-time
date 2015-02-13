require 'rails_helper'

RSpec.describe 'Routes' do
  it 'routes / to welcome#index' do
    expect(get: '/').to route_to(
      controller: 'welcome',
      action: 'index'
    )
  end
  
context 'Tales routes' do  
    it 'routes /tales to tales#index' do
      expect(get: '/tales').to route_to(
        controller: 'tales',
        action: 'index'
      )
    end
    
    it 'routes post /tales to tales#create' do
      expect(post: '/tales').to route_to(
        controller: 'tales',
        action: 'create'
      )
    end
    
    it 'routes /tales/new to tales#new' do
      expect(get: '/tales/new').to route_to(
        controller: 'tales',
        action: 'new'
      )
    end
    
    it 'routes /tales/:id to tales#show' do
      expect(get: '/tales/id').to route_to(
        controller: 'tales',
        action: 'show',
        id: 'id'
      )
    end
    
    it 'routes patch /tales/:id to tales#update' do
      expect(patch: '/tales/id').to route_to(
        controller: 'tales',
        action: 'update',
        id: 'id'
      )
    end

    it 'routes put /tales/:id to tales#update' do
      expect(put: '/tales/id').to route_to(
        controller: 'tales',
        action: 'update',
        id: 'id'
      )
    end    
    
  end
end

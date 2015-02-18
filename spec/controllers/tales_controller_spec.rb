require 'rails_helper'

RSpec.describe TalesController, type: :controller do
    
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it 'returns all of tale objects in db' do
      FactoryGirl.create_list(:tale, 3)
      get :index 
      expect(response.to_a.count).to eq(3)
    end
  end
  
  describe "GET #show" do
    it 'navigates to show page' do
      tale = FactoryGirl.create(:tale)
      user = FactoryGirl.create(:user)
      tale.update(:owner_id => user.id)
      FactoryGirl.create(:tale)
      get :show, { 'id' => tale.id }
      expect(response).to render_template(:show)
    end
    
    it 'returns http success' do
     tale = FactoryGirl.create(:tale)
     user = FactoryGirl.create(:user)
     tale.update(:owner_id => user.id)
     get :show, { 'id' => tale.id }
     expect(response).to have_http_status(:success)
    end
    
  end
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it 'creates a new instance of a tale' do
      get :new
      tale = response.body
      expect(tale).to_not be_nil
    end
  end

  describe "GET #create" do
    it "returns http success" do
      post :create, tale: FactoryGirl.attributes_for(:tale)
      expect(response).to redirect_to(tales_path)
    end
  end

  describe "GET #update" do
    it "redirects to tale page" do
      tale = FactoryGirl.create(:tale)
      patch :update, {'id' => tale.id, :user_id => @user.id, :tale_id => tale.id, :text => 'Sup'}
      expect(response).to redirect_to(tale_path(tale.id))
    end
    
    it 'calls method update_content' do
      tale = FactoryGirl.create(:tale)
      params = 
        {
          'id' => tale.id.to_s, 
          'user_id' => @user.id.to_s, 
          'tale_id' => tale.id.to_s, 
          'text' => 'Sup', 
          'controller' => 'tales', 
          'action' => 'update' 
        }
      expect(Tale).to receive(:update_content).with(params)
      patch :update, params 
    end
    
  end

end

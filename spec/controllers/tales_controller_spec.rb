require 'rails_helper'

RSpec.describe TalesController, type: :controller do
    
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
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
      FactoryGirl.create(:tale)
      get :show, { 'id' => tale.id }
      expect(response).to render_template(:show)
    end
    
    it 'returns http success' do
     tale = FactoryGirl.create(:tale)
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

  describe "GET #edit" do
    xit "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end

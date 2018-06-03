require 'rails_helper'

RSpec.describe RegisteredAppsController, type: :controller do
# Guests can't CRUD Apps -- should be redirected to sign-in.
# Signed-in Users can CRUD their own apps only.
  
  context "signed-in user doing CRUD on own their own apps" do
    before do
      #create and sign-in a confirmed user
      @user1 = create(:user)
      sign_in @user1
      @registered_app = create(:registered_app, user: @user1)
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
      
      it "renders the #index view" do
        get :index
        expect(response).to render_template :index
      end
    end
    
    describe "GET #new" do
      it "returns http success" do
         get :new
        expect(response).to have_http_status(:success)
      end
      
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @registered_app" do
         get :new
        expect(assigns(:registered_app)).not_to be_nil
      end
    end
    
    describe '#POST Create' do
      it 'assigns the new app to @registered_app' do
        post :create, registered_app: {url: "http://www.example.com"}
        expect(assigns(:registered_app)).to eq RegisteredApp.last
      end
      
      it 'redirects to the new app' do
        post :create, registered_app: {url: "http://www.example.com"}
        expect(response).to redirect_to RegisteredApp.last
      end
      
      it 'increases the RegisteredApp count by 1' do
        expect{ post :create, registered_app: {url: "http://www.example.com"} }.to change(RegisteredApp,:count).by(1)
      end
    end
    
    describe "GET #show" do
      it "returns http success" do
         get :show, id: @registered_app.id
        expect(response).to have_http_status(:success)
      end
      
      it "renders the #show view" do
        get :show, id: @registered_app.id
        expect(response).to render_template :show
      end
    end
    
    describe "DELETE destroy" do
      it "deletes the registered app" do
        delete :destroy, id: @registered_app.id
        count = RegisteredApp.where({id: @registered_app.id}).size
        expect(count).to eq 0
      end
      
      it "returns http redirect" do
        delete :destroy, id: @registered_app.id
        expect(response).to redirect_to root_path
      end
    end
    
    
  end
  
  context "signed in user trying to CRUD other user's apps" do
    before do
      #create 2 users, sign in the first one
      @user1 = create(:user)
      @user2 = create(:user)
      sign_in @user1
      # create app belonging to second user
      @registered_app2 = create(:registered_app, user: @user2)
    end
    
    describe "GET #show" do
        
      it "returns http redirect" do
        get :show, id: @registered_app2.id
        expect(response).to have_http_status(:redirect)
      end
      
      it "renders the #show view" do
        get :show, id: @registered_app2.id
        expect(response).to redirect_to root_path
      end
    end
    
    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, id: @registered_app2.id
        expect(response).to redirect_to root_path
      end
    end
  end
   
  context "guest" do
    describe "GET #index" do
      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(:redirect)
      end

      it "renders the login page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
  
  
  
  
  


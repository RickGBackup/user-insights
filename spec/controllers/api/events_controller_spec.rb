require 'rails_helper'

RSpec.describe API::EventsController, type: :controller do
  
  let!(:registered_app1) { create(:registered_app) }
  let!(:user1)  { create(:user) }
  
  describe '#POST Create' do
    before do
      sign_in user1
      # simulate request originating from registered_app1
      controller.request.env['HTTP_ORIGIN'] = registered_app1.url
    end
    
    it 'assigns the new event to @event' do
      post :create, event: { name: "Event 1", registered_app: registered_app1 }
      expect(assigns(:event)).to eq Event.last
    end
  
    it 'increases the Event count by 1' do
      expect { post :create, event: { name: "Event 1", registered_app: registered_app1 } }.to change(Event,:count).by(1) 
    end
    
    it 'returns json content type' do
      post :create, event: { name: "Event 1", registered_app: registered_app1 }
      expect(response.content_type).to eq("application/json")
    end
      
    it 'returns the event' do
      post :create, event: { name: "Event 1", registered_app: registered_app1 }
      expect(JSON.parse(response.body)["name"]).to eq("Event 1")
    end
  end
end

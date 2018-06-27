require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  before(:each) do
    @availability1 = FactoryBot.create(:availability, id: 1)
    @availability2 = FactoryBot.create(:availability, id: 2, date: '2018-06-02')
    @event1 = FactoryBot.create(:event, id: 1)
    @event2 = FactoryBot.create(:event, id: 2)
    @event3 = FactoryBot.create(:event, id: 3)
    @AE1 = FactoryBot.create(:availabilities_event, id: 1)
    @AE2 = FactoryBot.create(:availabilities_event, id: 2, event_id: 2)
    @AE3 = FactoryBot.create(:availabilities_event, id: 3, event_id: 3, availability_id: 2)
  end

  let(:valid_attributes) {
    {title: 'event', description: 'description', price: 10}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      event = Event.create(valid_attributes)
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      event = Event.create(valid_attributes)
      get :show, params: {id: event.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, params: {event: valid_attributes }, session: valid_session
        }.to change(Event, :count).by(1)
      end

      it "renders a JSON response with the new event" do

        post :create, params: {event: {title: 'event', description: 'description', price: 10} }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(event_url(Event.last))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: 'new event', description: 'new description', price: 20}
      }

      it "updates the requested event" do
        event = Event.create(valid_attributes)
        expect {
          put :update, params: {id: event.to_param, event: new_attributes}, session: valid_session
        }.to change { Event.last.price }.from(10).to(20)
      end

      it "renders a JSON response with the event" do
        event = Event.create(valid_attributes)

        put :update, params: {id: event.to_param, event: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event" do
      event = Event.create(valid_attributes)
      expect {
        delete :destroy, params: {id: event.to_param}, session: valid_session
      }.to change(Event, :count).by(-1)
    end
  end

end

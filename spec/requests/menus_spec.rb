require 'rails_helper'

RSpec.describe 'Menus Api', type: :request do
  # initialize test data
  let(:menu_id) {menu.first.id}

  # Test suite for GET /todos
  describe 'GET /menus' do
    # make HTTP get request before each example
    before { get '/menus'}

    it 'returns menus' do
      # `json` is a custome helper to parse JSON responses
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /menus/:id
  describe 'Get /menus/:id' do
    before { get "/menus/#{menu_id}"}

    context 'When the Menu exists' do
      it 'returns the menu' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(menu_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the menu does not exist' do
      let(:menu_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Menu/)
      end
    end
  end

  # Test suite for POST /menus
  describe 'POST /menus' do

    context 'when the request is valid' do
      before { post '/menus', params: valid_attributes }

      it 'creates a menu' do
        expect(json['title'])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for POST /menus/:id
  describe 'POST /menus/:id' do
    
    context 'when the menu exists' do
      before { put "/menus/#{menu_id}", params: valid_attributes }

      it 'updates the menu' do
        expect(response.body).to_not be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /menus/:id
  describe 'DELETE /menus/:id' do
    before { delete "/menus/#{menu_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
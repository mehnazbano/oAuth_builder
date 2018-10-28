require 'rails_helper'
RSpec.describe CurrenciesController, type: :controller do

  describe "CurrenciesController Scope" do
  	login_user
  	it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

    context 'GET /index' do
      it 'response should return valid status' do
        get :index
        expect(response.status).to eq 200
      end
      it 'response to render valid template' do
        get :index
        expect(response).to render_template(:index)
      end
      it 'validate content count' do
      	get :index, format: :json, as: :json
      	data = JSON.parse(response.body)
      	expect(data.count).to eq 10
      end
      it 'validate top ranked currencies' do
        get :index, format: :json, as: :json
      	data = JSON.parse(response.body)
        expected_result = [*1..10]
      	actual_result = data.collect {|a| a["attributes"]["rank"].to_i}
      	expect(actual_result).to eq expected_result
      end
      it 'validate data is sorted based on market cap' do
        get :index, format: :json, as: :json
        data = JSON.parse(response.body)
        actual_result = data.collect {|a| a["attributes"]["market_cap"]}
        expected_result = actual_result.sort.reverse
        expect(actual_result).to eq expected_result
      end
    end
  end
end

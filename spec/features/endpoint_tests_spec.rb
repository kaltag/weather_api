require 'rails_helper'

feature 'Attendance', type: :feature, js: true do
  scenario 'get current temperature' do
    VCR.use_cassette 'weather_info' do
      visit weather_current_path
      expect(page).to have_content('-6.1')
    end
  end

  scenario 'get 24h temperature' do
    VCR.use_cassette 'weather_info_history' do
      visit weather_historical_path
      expect(page).to have_content('-5.0')
      expect(page).to have_content('-7.2')
      expect(page).to have_content('-7.8')
      expect(page).to have_content('-6.1')
      expect(page).to have_content('-3.9')
      expect(page).to have_content('-2.8')
    end
  end

  scenario 'get max temperature' do
    VCR.use_cassette 'weather_info_history' do
      visit weather_historical_max_path
      expect(page).to have_content('-2.8')
    end
  end

  scenario 'get min temperature' do
    VCR.use_cassette 'weather_info_history' do
      visit weather_historical_min_path
      expect(page).to have_content('-7.8')
    end
  end

  scenario 'get avg temperature' do
    VCR.use_cassette 'weather_info_history' do
      visit weather_historical_avg_path
      expect(page).to have_content('-5.925')
    end
  end

  scenario 'get health status', type: :request do
    get '/health'
    expect(response).to have_http_status(:ok)
  end
end

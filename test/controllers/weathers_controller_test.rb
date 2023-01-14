require 'test_helper'

class WeathersControllerTest < ActionDispatch::IntegrationTest
  test 'should get current temp' do
    get weather_current_path, as: :json
    assert_response :success
  end

  test 'should get 24h temp' do
    get weather_historical_path, as: :json
    assert_response :success
  end

  test 'should get max temp' do
    get weather_historical_max_path, as: :json
    assert_response :success
  end

  test 'should get min temp' do
    get weather_historical_min_path, as: :json
    assert_response :success
  end

  test 'should get avg temp' do
    get weather_historical_avg_path, as: :json
    assert_response :success
  end
end

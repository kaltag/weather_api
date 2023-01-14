require 'net/http'

class WeathersController < ApplicationController
  APIKEY = 'YnlzZjAUPcF5iwMplNtzmLMtirwuAsnA'.freeze

  def current
    uri = URI('http://dataservice.accuweather.com/currentconditions/v1/292110')
    params = { apikey: APIKEY }
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)
    res = JSON.parse(response.body).first
    render json: res['Temperature']['Metric']['Value']
  end

  def get_his(tp = [])
    uri = URI('http://dataservice.accuweather.com/currentconditions/v1/292110/historical/24')
    params = { apikey: APIKEY }
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)
    res = JSON.parse(response.body)
    res.each do |t|
      tp << t['Temperature']['Metric']['Value']
    end
  end

  def historical
    tp = []
    get_his(tp = [])
    render json: tp
  end

  def max
    tp = []
    get_his(tp = [])
    render json: tp.max
  end

  def min
    tp = []
    get_his(tp = [])
    render json: tp.min
  end

  def avg
    tp = []
    get_his(tp = [])
    render json: tp.sum / tp.size
  end

  def health
    render json: {}, status: :ok
  end
end

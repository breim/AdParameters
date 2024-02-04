# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'services/placement_search'

class App < Sinatra::Base
  get '/search' do
    PlacementSearch.new(params).call
  end
end

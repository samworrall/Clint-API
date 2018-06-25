require 'sinatra'
require_relative './lib/event'

class EventManager < Sinatra::Base
  get '/' do
    'Welcome to the Clint API'
  end

  get '/events' do
    Event.all
  end

  run! if app_file ==$0
end

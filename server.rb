require 'sinatra'
require_relative './lib/event'

class EventManager < Sinatra::Base
  get '/' do
    'Welcome to the Clint API'
  end

  run! if app_file ==$0
end

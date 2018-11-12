class EspnController < ApplicationController

  require 'espn'

  ESPN.configure do |config|
    config.apikey = "YOUR_API_KEY"
  end


end

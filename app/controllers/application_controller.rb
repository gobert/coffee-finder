class ApplicationController < ActionController::API
  def error
    raise 'Error to test error logging'
  end
end

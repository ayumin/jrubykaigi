require 'rubygems'
require 'sinatra'
require 'json'

DOCUMENT_ROOT = File.expand_path('..', File.dirname(__FILE__))

class JRubyKaigiApp < Sinatra::Application
  post '/notify' do
    payload = JSON.parse(params[:payload])
    pull(payload)
    nil
  end

private

  def pull(payload)
    system("cd #{DOCUMENT_ROOT}; git pull")
  end
end
run JRubyKaigiApp.new

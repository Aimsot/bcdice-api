# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/reloader' if development?
require 'exception'

module BCDiceAPI
  class Base < Sinatra::Base
    class << self
      attr_accessor :test_rands
    end

    configure :production do
      set :dump_errors, false
    end

    configure :development do
      register Sinatra::Reloader
    end

    # Sinatra 4.1 以降は development 環境で localhost 以外の Host を拒否するため、
    # Vercel の Preview（APP_ENV=development）では制限を外す（公開 API のため問題なし）
    set :host_authorization, { permitted_hosts: [] } if ENV['VERCEL']

    before do
      response.headers['Access-Control-Allow-Origin'] = '*'
    end
  end
end

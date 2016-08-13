class Api::V1::ApiController < ActionController::API
  include ActionController::Serialization
  after_filter :set_cors_headers, only: :index

  private

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = %w{GET POST OPTIONS}.join(",")
  end
end

class ApplicationController < ActionController::API
  rescue_from Exception, with: :render_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404


  def render_404
    render json: { error: "Not Found" }, status: 404
  end

  def render_500
    render json: { error: "Internal Server Error" }, status: 500
  end
end

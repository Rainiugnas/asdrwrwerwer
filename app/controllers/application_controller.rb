class ApplicationController < ActionController::Base
  before_action :authenticated_user!

  layout 'success'

  def render_error status, data
    @data = data || {}

    render 'layouts/error', layout: false, status: status
  end

  def authenticated_user!
    token = Token.new request.headers[:Authorization]

    render_error :unauthorized, message: 'invalid token' if token.invalid?
  end
end

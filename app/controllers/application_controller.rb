class ApplicationController < ActionController::Base
  layout 'success'

  def render_error status, data
    @data = data || {}

    render 'layouts/error', layout: false, status: status
  end
end

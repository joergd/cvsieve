class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def devise_parameter_sanitizer
    if resource_class == Business
      Business::ParameterSanitizer.new(Business, :business, params)
    else
      super # Use the default one
    end
  end
end

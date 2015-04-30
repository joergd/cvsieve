class Business::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:name, :email, :contact, :tel, :password, :password_confirmation)
  end
  def account_update
    default_params.permit(:name, :email, :contact, :tel, :password, :password_confirmation)
  end
end



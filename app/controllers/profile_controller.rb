class ProfileController < Devise::RegistrationsController

  layout "application"

  protected

    def after_update_path_for(resource)
      profile_path(resource)
    end

    def update_resource(resource, params)
    resource.update_without_password(params)
  end
end

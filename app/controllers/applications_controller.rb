class ApplicationsController < ApplicationController
  before_action :authenticate_business!

  def index
    @applications = current_business.applications.order(created_at: :desc)
  end
end

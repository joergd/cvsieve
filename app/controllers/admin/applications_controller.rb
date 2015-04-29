class Admin::ApplicationsController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
    @applications = Application.all.order_by_business_name
  end
end

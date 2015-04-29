class Admin::BusinessesController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  before_filter :get_business, except: [:index]

  def index
    @businesses = Business.all.order(name: :asc)
  end

  def suspend
    @business.update_attribute :status, Business::SUSPENDED_STATUS
    redirect_to admin_businesses_path
  end

  def activate
    @business.update_attribute :status, Business::ACTIVE_STATUS
    redirect_to admin_businesses_path
  end

  def destroy
    @business.destroy
    redirect_to admin_businesses_path
  end

private

  def get_business
    @business = Business.find(params[:id])
  end
end

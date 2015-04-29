class ApplicationsController < ApplicationController
  before_action :authenticate_business!, except: [:new, :create, :thankyou]
  before_filter :get_job, except: [:index]

  def index
    @applications = current_business.applications.order(created_at: :desc)
  end

  def new
  end

  def create
    redirect_to thankyou_path(@job)
  end

  def thankyou


  end

private

  def get_job
    @job = Job.find_by_secret_id!(params[:id])
  end
end

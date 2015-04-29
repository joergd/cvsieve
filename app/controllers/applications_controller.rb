class ApplicationsController < ApplicationController
  before_action :authenticate_business!, except: [:new, :create, :thankyou]
  before_filter :get_job, except: [:index, :show]

  def index
    @applications = current_business.applications.order(created_at: :desc)
  end

  def show
    @application = current_business.applications.find(params[:id])
  end

  def new
    @application = @job.applications.build
  end

  def create
    @application = @job.applications.build(application_params)

    if @application.save
      redirect_to thankyou_path(@job)
    else
      render :new
    end
  end

  def thankyou
  end

private

  def get_job
    @job = Job.find_by_secret_id!(params[:id])
  end

  def application_params
    params.require(:application).permit(:name, :email, :tel, :answer, :video)
  end
end

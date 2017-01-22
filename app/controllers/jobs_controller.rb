class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save
    render :new
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:jobs).permit[:title, :category, :company, :description, :location]
  end
end

class JobsController < ApplicationController

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      flash.now[:notice] = "Não foi possível criar a vaga"
      @companies = Company.all
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :category, :company_id, :description, :location, :featured)
  end
end

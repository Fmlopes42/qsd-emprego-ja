class JobsController < ApplicationController

  def new
    @job = Job.new
    all_collections
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      flash.now[:notice] = "Não foi possível criar a vaga"
      all_collections
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
    all_collections
  end

  def update
    @job = Job.find(params[:id])
    all_collections
    if @job.update(job_params)
      redirect_to @job
    else
      flash.now[:notice] = "Não foi possível atualizar a vaga"
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :category_id, :company_id, :description, :location, :featured)
  end

  def all_collections
    @companies = Company.all
    @categories = Category.all
  end
end

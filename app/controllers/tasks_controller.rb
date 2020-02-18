class TasksController < ApplicationController
  def index # read all tasks
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new # display the new form
    @task = Task.new
  end

  def create # create the restaurant and store it in the DB
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end

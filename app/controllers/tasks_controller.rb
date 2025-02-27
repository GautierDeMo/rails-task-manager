class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def find_task
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def show
    # raise
  end

  def new
    @task = Task.new
  end

  def create
    # raise
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    # raise
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end

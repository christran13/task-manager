class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :all_tasks, only: [:index, :create, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
  end

  def update
    @task.update(task_params)
  end

  def destroy
    @task.destroy
  end

  private

    def all_tasks
      @tasks = Task.order(deadline: :asc)  
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :deadline)
    end
end

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    #Change task to tasks
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      #Need to redirect to @task, not @tasks
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  #Needed to be 'set_task' instead of 'set_tasks'
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      #Need to allow description
      params.require(:task).permit(:priority, :description)
    end
end

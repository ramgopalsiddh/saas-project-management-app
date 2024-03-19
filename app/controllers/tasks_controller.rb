# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:index, :new, :create]

  def index
    @tasks = @project.tasks
  end
    
  def show
  end
    
  def new
   # @project = Project.find(params[:project_id])
    @task = @project.tasks.build
    @task.user_id = current_user.id
  end
    
    def create
      @task = @project.tasks.build(task_params)
      if current_user.admin?  # Assuming you have a method to check if the user can assign tasks
        @task.user_id = params[:task][:user_id]  # Assign the user_id based on the selected user
      else
        @task.user_id = current_user.id  # Assign the user_id to the current user if they cannot assign tasks
      end

      if @task.save
        redirect_to project_tasks_path(@task.project, @task), notice: 'Task was successfully created.'
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
      if @task.update(task_params)
        redirect_to project_tasks_path(@task.project), notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
    
    def destroy
      @task.destroy
      redirect_to project_tasks_path(@task.project), notice: 'Task was successfully destroyed.'
    end
    
    private
    def set_project
      @project = Project.find(params[:project_id])
    end

  def set_task
    @task = Task.find(params[:id])
  end
    
  def task_params
    params.require(:task).permit(:name, :done, :project_id, :user_id)
  end

  def authorize_user
    unless current_user.admin? || @task.user == current_user
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

end
  
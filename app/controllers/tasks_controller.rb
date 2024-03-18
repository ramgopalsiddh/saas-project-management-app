# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    
    def index
      @tasks = Task.all
    end
    
    def show
    end
    
    def new
        @project = Project.find(params[:project_id])
        @task = @project.tasks.build
        @task.user_id = current_user.id
    end
    
    def create
      @task = Task.new(task_params)
      @task.user_id = current_user.id

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
      def set_task
        @task = Task.find(params[:id])
      end
    
      def task_params
        params.require(:task).permit(:name, :done, :project_id, :user_id)
      end
  end
  
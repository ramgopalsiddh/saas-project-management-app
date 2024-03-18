class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :authorize_member, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    begin
      @projects = current_user.projects
      # show errer if you don't have tenant of 
    rescue ActsAsTenant::Errors::NoTenantSet
      flash[:alert] = "You do not have a tenant. Please set a tenant before access."
      redirect_to root_path
    end
  end

  # GET /projects/1 or /projects/1.json
  def show
    @project = Project.find(params[:id])
    @current_member = current_user.members.find_by(project_id: @project.id)
    @artifacts = @project.artifacts
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        @project.members.create(user: current_user, roles: {admin: true})
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.members.destroy_all # Delete associated members

    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      project_id = params[:id]
      flash[:alert] = "You are not have Project with Project ID #{project_id}."
      redirect_to projects_path
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:account_id, :name, :details, :expected_completion_date)
    end

    # Check project member Authorization
    def authorize_member
      return redirect_to root_path, alert: 'You are not a member' unless @project.users.include? current_user
    end

end

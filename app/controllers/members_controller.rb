class MembersController < AuthorizedController
  before_action :set_project
  before_action :find_project
  before_action :find_member, only: [:destroy]

  def index
    @member = @current_project.members
  end
  
  def invite
    email = params[:email]
    return redirect_to project_members_path(@current_project), alert: "No email provided" if email.blank?
  
    if current_user.admin? # Check if the current user is an admin
      user = User.find_by(email: email)
      if user.nil?
        user = User.invite!({ email: email }, current_user) # current_user will be set as invited_by
        return redirect_to project_members_path(@current_project), alert: "Email Invalid" unless user.persisted?
      end
  
      if user.members.find_by(project: @current_project).nil?
        user.members.create(project: @current_project, roles: { admin: false, editor: true })
        redirect_to project_members_path(@current_project), notice: "#{email} invited!"
      else
        redirect_to project_members_path(@current_project), alert: "#{email} is already a member!"
      end
    else
      redirect_to project_members_path(@current_project), alert: "Only admins can send invitations!"
    end
  end

  def destroy
    # Check if the current user is an admin and is not deleting themselves
    if current_user.admin? && current_user != @member.user
      @member.destroy
      flash[:notice] = "Member successfully removed from the project."
    else
      flash[:alert] = "You do not have permission to remove this member."
    end
    redirect_to project_members_path(@current_project)
  end


  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def find_project
    @current_project = Project.find(params[:project_id])
  end

  def find_member
    @member = @current_project.members.find(params[:id])
  end

end

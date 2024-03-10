class MembersController < AuthorizedController

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

end

class AuthorizedController < ApplicationController
  before_action :set_current_project
  before_action :authorize_member

  private

  def set_current_project
    membership = current_user.members.find_by(project_id: params[:project_id])
    @current_project = membership.project if membership
    unless @current_project
      flash[:alert] = 'You are not a member of this project.'
      redirect_to projects_path
    end
  end

  def authorize_member
    return redirect_to root_path, alert: 'You are not a member' unless @current_project.users.include? current_user
  end

end
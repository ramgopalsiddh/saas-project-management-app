class Member < ApplicationRecord
  belongs_to :user
  belongs_to :project

  # for define Admin in Members that 
  def admin?
    roles["admin"] == true
  end

  def editor?
    roles["editor"] == true
  end
end

class Project < ApplicationRecord
  acts_as_tenant :account
  belongs_to :account

  attr_accessor :plan

  validates_uniqueness_of :name, scope: :account_id, if: :name_changed? # scope use for mantain uniqueness only in tenant
  validate :free_plan_can_only_have_one_project, on: :create

  has_many :artifacts, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :users, through: :members # Assuming roles are associated with members

  # Set limit of project according to plan
  def free_plan_can_only_have_one_project
    if account.plan == 'free' && account.projects.count >= 1 && !premium_plan?
      errors.add(:base, "Free plan can have only one project")
    end
  end
  
  def premium_plan?
    account.plan == 'premium'
  end

end

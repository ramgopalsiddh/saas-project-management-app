class Project < ApplicationRecord
  acts_as_tenant :account
  belongs_to :account

  attr_accessor :plan

  validates_uniqueness_of :name, if: :name_changed?
  validate :free_plan_can_only_have_one_project, on: :create

  has_many :members, dependent: :destroy
  has_many :users, through: :members # Assuming roles are associated with members

  def free_plan_can_only_have_one_project
    if account.plan == 'free' && account.projects.count >= 1
      errors.add(:base, "Free plan can have only one project")
    end
  end

end

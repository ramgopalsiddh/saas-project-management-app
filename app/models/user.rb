class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable
  has_many :members
  has_many :projects, through: :members
  has_many :accounts, foreign_key: 'creator_id'
  belongs_to :account


  # for define Admin in Members
  def admin?
    member = self.members.first
    member.present? && member.admin?
  end
end

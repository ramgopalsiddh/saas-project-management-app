class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates_uniqueness_of :name
  validates_presence_of :name, :user_id
end
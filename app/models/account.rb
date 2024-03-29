class Account < ApplicationRecord
  validates_uniqueness_of :name, :domain, :subdomain
  validates_presence_of :domain, :subdomain
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :projects, dependent: :destroy
  has_one :payment, dependent: :destroy
  accepts_nested_attributes_for :payment

end

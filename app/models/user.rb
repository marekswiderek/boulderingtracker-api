class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  before_create :set_default_user_role

  has_many :roles
  has_many :ascents

  def admin?
    self.roles.map { |r| r[:name] }.include? "admin"
  end

  def user?
    self.roles.map { |r| r[:name] }.include? "user"
  end

  private
  def set_default_user_role
    self.roles.build(name: "user")
  end
end

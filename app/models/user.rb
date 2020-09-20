class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role, optional: true

  after_create :assign_role

  def assign_role
    self.update(role_id: Role.find_by_name("user").id) if self.role.blank?
  end
end

class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy

  after_save :assign_role_default

  def admin?
    has_role?(:admin)
  end

  def client?
    has_role?(:client)
  end

  private

  def assign_role_default
    self.add_role(:client)
  end
end

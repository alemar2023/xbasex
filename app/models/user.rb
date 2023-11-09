class User < ApplicationRecord

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, :validatable, :trackable

  validates :role, presence: true
  enum role: %w[superadmin admin moderator user].index_by(&:itself), _prefix: :role
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= "user"

  end
=begin

  def is_superadmin?
    self.current_user.role == "superadmin"
  end
  def is_admin?
    self.current_user.role == "admin"
  end
=end




end

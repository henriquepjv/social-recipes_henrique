class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes

  scope :most_recent, -> {order(id: :desc)}

  after_create :notify

  private

  def notify
    UserMailer.notify_new_user(self).deliver_now
  end
end

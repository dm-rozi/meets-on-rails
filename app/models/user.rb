class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Юзер может создавать много событий
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  # Добавим заодно валидации для юзера
  # Имя не не более 35 символов
  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 35 },
    format: { without: /\W+/ }
  # Уникальный email по заданному шаблону не более 255
  # символов
  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end

  def set_name
    self.name = "User_#{rand(999)}" if self.name.blank?
  end
end

class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name,
    presence: true, 
    unless: -> { user.present? }
  
  validates :user_email,
    presence: true,
    format: { with: /[\w]+@[\w\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
    unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }
  validate :check_reg_mail, unless: -> { user.present? }
  
  def user_name
    if user.present?
      user.name
    else
      super
    end 
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end 
  end

  def check_reg_mail
    if User.find_by(email: user_email).present?
      errors.add(:user_email, I18n.t('errors.dublicate_email'))
    end
  end
end

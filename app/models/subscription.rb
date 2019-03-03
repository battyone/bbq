class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  before_validation :user_email_downcase

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true,
                         format: { with: VALID_EMAIL_REGEX },
                         uniqueness: { scope: :event_id },
                         unless: -> { user.present? }
  validate :email_availability, unless: -> { user.present? }
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }

  def user_name
    return user.name if user.present?
    super
  end

  def user_email
    return user.email if user.present?
    super
  end

  def email_availability
    errors.add(:user_email, :not_available) if User.find_by(email: user_email)
  end

  private

  def user_email_downcase
    user_email.downcase! if user_email.present?
  end
end

class User < ActiveRecord::Base

  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates_presence_of :email, :full_name, :location
  validates_length_of :bio, minimum: 30, allow_blank: false
  validates_uniqueness_of :email


  validate do
    errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
  end

  has_secure_password
  
  before_create do |user|
    user.confirmation_toke = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?

    self.confirmation_at = Time.current
    self.confirmation_toke = ''
    save!
  end

  def confirmed?
    confirmation_at.present?
  end
end

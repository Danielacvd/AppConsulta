class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_and_belongs_to_many :pacientes
  belongs_to :cargo
  attribute :cargo_id, :integer, default: 9

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.name = auth.info.name
   end
  end

  mount_uploader :photo, AvatarUploader

  after_initialize do
    if self.new_record?
      self.role ||= :visit
    end
  end
  enum role: [:visit, :admin]


end

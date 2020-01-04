class Paciente < ApplicationRecord
  mount_uploader :photo, AvatarUploader
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tests
  has_many :sesion_particulars
end

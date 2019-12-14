class Paciente < ApplicationRecord
  mount_uploader :photo, AvatarUploader
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tests
  belongs_to :sesion_particulars
end

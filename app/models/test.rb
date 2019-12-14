class Test < ApplicationRecord
  mount_uploader :photo, AvatarUploader
  has_and_belongs_to_many :pacientes
  has_and_belongs_to_many :tratamientos
end

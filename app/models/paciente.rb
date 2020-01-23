class Paciente < ApplicationRecord
  mount_uploader :photo, AvatarUploader
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tests
  has_many :sesion_particulars, dependent: :destroy
  has_many :tratamientos, dependent: :destroy

  after_initialize do
    if self.new_record?
      self.role ||= :colegio
    end
  end
  enum role: {colegio: 0, particular: 1}
end

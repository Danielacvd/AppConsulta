class Tratamiento < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :sesion_colegios
  belongs_to :paciente
end

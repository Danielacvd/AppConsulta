class Tratamiento < ApplicationRecord
  has_and_belongs_to_many :tests
  belongs_to :sesion_colegios
end

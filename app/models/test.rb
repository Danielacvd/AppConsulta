class Test < ApplicationRecord
  has_and_belongs_to_many :pacientes
  has_and_belongs_to_many :tratamientos
end

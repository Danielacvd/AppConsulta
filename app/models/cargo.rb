class Cargo < ApplicationRecord
  has_many :users, dependent: :destroy
end

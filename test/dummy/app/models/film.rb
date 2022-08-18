class Film < ApplicationRecord
  belongs_to :studio
  has_many :appearances
end

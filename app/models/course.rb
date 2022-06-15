class Course < ApplicationRecord

  has_many :unit_courses, dependent: :destroy
  has_many :units, through: :unit_courses
  accepts_nested_attributes_for :units

  validates_presence_of :title, :volume
end

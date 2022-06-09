class Course < ApplicationRecord
  has_and_belongs_to_many :units,  :join_table => :units_courses, dependent: :destroy
  accepts_nested_attributes_for :units
  validates_presence_of :title, :volume
end

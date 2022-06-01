class Course < ApplicationRecord
  has_and_belongs_to_many :units,  :join_table => :units_courses
  validates_presence_of :title, :volume
end

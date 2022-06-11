class UnitCourse < ApplicationRecord
  self.table_name = "units_courses"

  belongs_to :unit
  belongs_to :course
end

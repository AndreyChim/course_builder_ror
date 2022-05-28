class Unit < ApplicationRecord
  has_and_belongs_to_many :courses,  :join_table => :units_courses
  validates_presence_of :title, :body
end
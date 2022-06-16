class Unit < ApplicationRecord
  has_and_belongs_to_many :courses,  :join_table => :units_courses, dependent: :destroy

  accepts_nested_attributes_for :courses
  validates_presence_of :title, :body

  # before_save :create_hashtags
end

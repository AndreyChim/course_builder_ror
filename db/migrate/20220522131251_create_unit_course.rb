class CreateUnitCourse < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_courses, id: false do |t|
      
      t.belongs_to :unit
      t.belongs_to :course

      t.timestamps
    end
  end
end

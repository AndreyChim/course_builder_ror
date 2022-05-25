class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    # create_table :units_courses, id: false do |t|
    # create_join_table :units, :courses, table_name: :units_courses, id: false do |t|
      create_join_table :units, :courses, table_name: :units_courses, column_options: { null: false, foreign_key: true }, force: :cascade do |t|
        t.index [:unit_id, :course_id]
        t.index [:course_id, :unit_id]
      
      
      t.belongs_to :units
      t.belongs_to :courses



      t.timestamps 

      end
    end
  end
class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :volume
      t.integer :price
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

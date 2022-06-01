class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :volume
      t.integer :price
      t.boolean :active, default: true

     # https://guides.rubyonrails.org/getting_started.html#adding-a-second-model
     # t.references :article, null: false, foreign_key: true
     
      t.timestamps
    end
  end
end

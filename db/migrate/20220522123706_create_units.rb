class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :title
      t.text :body
      t.boolean :active, default: true

      # https://guides.rubyonrails.org/getting_started.html#adding-a-second-model
     # t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end


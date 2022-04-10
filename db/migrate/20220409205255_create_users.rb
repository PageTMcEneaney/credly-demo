class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :userId
      t.string :name
      t.text :description
      t.string :thumbnail
      t.string :resourceURI

      t.timestamps
    end
  end
end

class CreateVacants < ActiveRecord::Migration[7.0]
  def change
    create_table :vacants do |t|
      t.string :title
      t.text :description
      t.integer :salary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

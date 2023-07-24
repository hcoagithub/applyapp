class CreatePostulations < ActiveRecord::Migration[7.0]
  def change
    create_table :postulations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vacant, null: false, foreign_key: true

      t.timestamps
    end
  end
end

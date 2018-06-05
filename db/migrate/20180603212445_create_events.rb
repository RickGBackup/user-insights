class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name

      t.timestamps null: false
      t.references :registered_app, index: true, foreign_key: true
    end
  end
end

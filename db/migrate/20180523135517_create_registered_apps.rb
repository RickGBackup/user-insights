class CreateRegisteredApps < ActiveRecord::Migration
  def change
    create_table :registered_apps do |t|

      t.timestamps null: false
      t.string :url
      t.references :user, index: true, foreign_key: true
    end
  end
end

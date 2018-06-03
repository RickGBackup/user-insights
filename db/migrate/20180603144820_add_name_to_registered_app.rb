class AddNameToRegisteredApp < ActiveRecord::Migration
  def change
    add_column :registered_apps, :name, :string
  end
end

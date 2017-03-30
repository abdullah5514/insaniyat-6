class CreateUnregisters < ActiveRecord::Migration[5.0]
  def change
    create_table :unregisters do |t|
      t.string :phoneno
      t.string :name

      t.timestamps
    end
  end
end

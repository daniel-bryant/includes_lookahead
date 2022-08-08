class CreateStudios < ActiveRecord::Migration[7.0]
  def change
    create_table :studios do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end

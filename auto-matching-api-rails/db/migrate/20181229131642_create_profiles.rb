class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.integer :sex
      t.integer :from

      t.timestamps
    end
  end
end

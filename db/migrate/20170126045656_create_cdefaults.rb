class CreateCdefaults < ActiveRecord::Migration[5.0]
  def change
    create_table :cdefaults do |t|
      t.string :name
      t.string :type
      t.boolean :default

      t.timestamps
    end
  end
end

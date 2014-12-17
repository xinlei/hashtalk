class CreateTiks < ActiveRecord::Migration
  def change
    create_table :tiks do |t|
      t.references :user, index: true
      t.text :value

      t.timestamps
    end
  end
end

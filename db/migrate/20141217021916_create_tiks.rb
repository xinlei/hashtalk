class CreateTiks < ActiveRecord::Migration
  def change
    create_table :tiks do |t|
      t.belongs_to :user
      t.text :value

      t.timestamps
    end
  end
end

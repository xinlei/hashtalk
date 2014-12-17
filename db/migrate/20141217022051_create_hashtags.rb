class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.references :tik, index: true
      t.string :value

      t.timestamps
    end
  end
end

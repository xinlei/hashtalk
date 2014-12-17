class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user, index: true
      t.references :tik, index: true
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end
  end
end

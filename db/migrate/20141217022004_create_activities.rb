class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user
      t.belongs_to :tik
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end
  end
end

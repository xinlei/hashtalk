class CreateTiksAndHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags_tiks, id:false do |t|
      t.belongs_to :tik
      t.belongs_to :hashtag
    end
  end
end

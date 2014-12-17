class CreateTiksAndHashtags < ActiveRecord::Migration
  def change
    create_table :tiks_hashtags, id:false do |t|
      t.belongs_to :tik
      t.belongs_to :hashtag
    end
  end
end

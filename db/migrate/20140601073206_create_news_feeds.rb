class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.string :title
      t.text :text
      t.string :tagname, default: "untagged"
      t.timestamps
    end
  end
end

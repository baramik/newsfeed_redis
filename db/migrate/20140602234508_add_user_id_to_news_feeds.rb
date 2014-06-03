class AddUserIdToNewsFeeds < ActiveRecord::Migration
  def change
    add_column :news_feeds, :user_id, :integer
  end
end

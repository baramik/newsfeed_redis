class NewsFeed < ActiveRecord::Base
	scope :news_category, -> (tagname){where("tagname LIKE ?", "%#{tagname}%")}

	belongs_to :user

	def set_news_category(tagname_to_set)
		self.tagname = tagname_to_set
		self.save!
	end 

end

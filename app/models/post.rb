class Post < ApplicationRecord
 has_rich_text :description 
 belongs_to :author
end

class Post < ApplicationRecord
    paginates_per 3
 has_rich_text :description 
 belongs_to :author, class_name: "Author"
 has_many :comentarios, dependent: :destroy
has_many :taggables, dependent: :destroy
has_many :tags, through: :taggables

end 



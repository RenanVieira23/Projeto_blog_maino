class Post < ApplicationRecord
 has_rich_text :description 
 belongs_to :author, class_name: "Author"
 has_many :comentarios, dependent: :destroy 

end 



class CreateComentarios < ActiveRecord::Migration[7.0]
  def change
    create_table :comentarios do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.belongs_to :author, null: true, foreign_key: true

      t.timestamps
    end
  end
end

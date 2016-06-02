class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :guid
      t.string :source
      t.string :lang

      t.timestamps null: false
    end
  end
end

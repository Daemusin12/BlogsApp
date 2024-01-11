class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.integer :feedbacks_count, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

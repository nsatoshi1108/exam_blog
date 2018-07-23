class CreateBlog < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :name
      t.string :content
    end
  end
end

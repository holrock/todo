class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :text
      t.timestamps null: false
    end

    create_table :todo_tags do |t|
      t.belongs_to :todo_item
      t.belongs_to :tag
      t.timestamps null: false
    end

  end
end

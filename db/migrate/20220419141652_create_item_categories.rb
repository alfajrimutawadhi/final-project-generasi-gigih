class CreateItemCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :item_categories do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true
    end
  end
end

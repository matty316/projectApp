class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :store
      t.references :user, index: true

      t.timestamps
    end
  end
end

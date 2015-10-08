class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.text :text
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

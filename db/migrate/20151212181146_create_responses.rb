class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :advertisement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateVoices < ActiveRecord::Migration[6.0]
  def change
    create_table :voices do |t|
      t.string :text
      t.text :image
      t.integer :user_id
      t.timestamps
    end
  end
end

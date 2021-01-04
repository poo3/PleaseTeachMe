class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :subject
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :questions,[:user_id,:created_at]
  end
end

class AddColumnTitleToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :title, :string
  end
end

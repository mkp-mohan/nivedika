class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.text :summary
      t.text :status
      t.text :fix_version
      t.text :description

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :desc
      t.string :date
      t.string :comments

      t.timestamps null: false
    end
  end
end

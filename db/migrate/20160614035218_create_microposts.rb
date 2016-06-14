class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :body
      t.timestamps null: false
    end
  end
end

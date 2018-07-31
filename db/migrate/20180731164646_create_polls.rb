class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.text :content

      t.timestamps
    end
  end
end

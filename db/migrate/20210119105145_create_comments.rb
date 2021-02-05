class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.text :comment , null:false
      t.references :user , foreign_key: true
      t.references :tweet , foreign_key: true
    end
  end
end

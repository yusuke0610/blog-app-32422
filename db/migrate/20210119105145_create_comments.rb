class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.text :comment , null:false
      t.references :user , null:false
      t.references :tweet , null:false
    end
  end
end

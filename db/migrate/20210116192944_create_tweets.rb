class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|

      t.timestamps
      t.string     :title, null:false
      t.text       :text,  null:false
      t.references :user,  foreign_key:true
    end
  end
end

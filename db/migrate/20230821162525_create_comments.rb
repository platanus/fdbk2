class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :feedback_session, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end

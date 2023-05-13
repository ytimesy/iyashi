class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references  :conversation, null: false, foreign_key: true
      t.references  :user, null: false, foreign_key: true
      t.text        :body
      t.text        :ai_response
      t.timestamps
    end
  end
end

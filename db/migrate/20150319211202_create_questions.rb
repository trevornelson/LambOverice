class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references    :user, null: false
      t.string        :title, null: false
      t.text          :content
      t.references    :category

      t.timestamps
    end
  end
end

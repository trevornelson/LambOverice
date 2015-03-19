class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references    :user, null: false
      t.references    :voteable, polymorphic: true, index: true, null: false
      t.string        :type, null: false

      t.timestamps
    end
  end
end

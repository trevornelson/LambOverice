class AddVoteCountToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :vote_count, :integer, default: 1
  end
end

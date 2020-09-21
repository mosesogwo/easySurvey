class AddQuestionNoToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :question_no, :integer
  end
end

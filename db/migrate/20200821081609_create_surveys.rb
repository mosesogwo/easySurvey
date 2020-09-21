class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.references :admin, null: false, foreign_key: true
      t.datetime :end_date

      t.timestamps
    end
  end
end

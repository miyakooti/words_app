class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :quiz
      t.text :answer
      t.integer :user_id 
      
      t.timestamps
    end
  end
end

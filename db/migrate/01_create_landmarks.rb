class CreateLandmarks < ActiveRecord::Migration[5.2]
  def change
      # raise 'Write CreateLandmarks migration here'
    create_table :landmarks do |t|
      t.string :name
      t.integer :figure_id
      t.integer :year_completed
    end
  end
end

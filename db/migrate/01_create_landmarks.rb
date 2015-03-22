class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
        t.string :name, :year_completed
        t.belongs_to :figure, index: true

        t.timestamps null: false
    end
  end
end

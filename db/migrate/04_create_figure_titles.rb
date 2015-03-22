class CreateFigureTitles < ActiveRecord::Migration

	def change
		create_table :figure_titles do |t|
			t.belongs_to :figures, index: true
			t.belongs_to :titles, index: true

			t.timestamps null: false
		end
	end
end

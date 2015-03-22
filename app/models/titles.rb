class Title < ActiveRecord::Base
	has_many :figures, through: :figure_title
end

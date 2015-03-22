class Figure < ActiveRecord::Base
has_many :titles, through: :figure_title
has_many :landmarks
end

class Figure < ActiveRecord::Base #integers are created by attribute: n (as in year: 1972), not attribute: :n
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles
end

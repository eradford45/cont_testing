class Person < ApplicationRecord
  validates_presence_of :eye_color, :hair_color
end

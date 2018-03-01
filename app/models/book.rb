class Book < ApplicationRecord
    validates_presence_of :genre
    validates_presence_of :author
end

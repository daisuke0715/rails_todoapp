class Book < ApplicationRecord
    validates :title, presence: true, null: false
    validates :body, presence: true, null: false
end

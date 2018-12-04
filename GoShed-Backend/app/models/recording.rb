class Recording < ApplicationRecord
    belongs_to :user
    has_many_attached :file
end

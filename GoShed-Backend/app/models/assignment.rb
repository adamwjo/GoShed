class Assignment < ApplicationRecord
    has_many :users
    mount_uploader :file, FileUploader
end

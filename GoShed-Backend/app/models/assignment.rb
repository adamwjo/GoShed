class Assignment < ApplicationRecord
    belongs_to :teacher, optional: true
    mount_uploader :file, FileUploader
end

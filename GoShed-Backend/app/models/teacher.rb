class Teacher < ApplicationRecord
    has_many :assignments
    has_secure_password
end

class User < ApplicationRecord
    has_many :assignments
    has_many :students, :foreign_key => "teacher_id", :class_name => "User"
    belongs_to :teacher, :class_name => "User", optional: true
    has_many :homeworks 
    has_secure_password
end

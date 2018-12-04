class UserSerializer < ActiveModel::Serializer
  has_many :assignments
  belongs_to :teacher, :class_name => "User"
  has_many :students, :foreign_key => "student_id", :class_name => "Relationship"
  attributes :id, :first_name, :last_name, :email, :account_type, :homeworks
end

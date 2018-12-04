class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :file, :user_id, :name, :users
  has_many :users
end

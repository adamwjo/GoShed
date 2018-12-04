class RelationshipSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :student_id
end

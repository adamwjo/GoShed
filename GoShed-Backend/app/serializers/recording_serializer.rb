class RecordingSerializer < ActiveModel::Serializer
  attributes :id, :file, :user_id
end

class UserSerializer < ActiveModel::Serializer
  has_many :assignments
  attributes :id, :first_name, :last_name, :email, :account_type
end

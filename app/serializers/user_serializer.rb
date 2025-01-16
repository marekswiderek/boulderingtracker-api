class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :surname, :created_at
end

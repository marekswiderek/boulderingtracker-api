class BoulderWithoutAscentsSerializer
  include JSONAPI::Serializer
  attributes :name, :grade, :ascents_count
end

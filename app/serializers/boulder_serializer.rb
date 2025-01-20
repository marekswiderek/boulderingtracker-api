class BoulderSerializer
  include JSONAPI::Serializer
  has_many :ascents, serializer: AscentSerializer

  attributes :name, :grade, :ascents_count
end

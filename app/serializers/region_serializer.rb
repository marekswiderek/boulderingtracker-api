class RegionSerializer
  include JSONAPI::Serializer
  has_many :boulders, serializer: BoulderWithoutAscentsSerializer

  attributes :name, :boulders_count
end

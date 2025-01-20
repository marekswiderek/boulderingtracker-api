class RegionSerializer
  include JSONAPI::Serializer
  has_many :boulders, serializer: BoulderSerializer

  attributes :name, :boulders_count
end

class AscentSerializer
  include JSONAPI::Serializer
  attributes :user_id, :ascent_date, :attempts
end

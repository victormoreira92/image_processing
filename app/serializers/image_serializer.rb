class ImageSerializer
  include JSONAPI::Serializer
  attributes :file_image, :created_at
end

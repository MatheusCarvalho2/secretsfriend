class UserSerializer # rubocop:disable Style/FrozenStringLiteralComment
  include JSONAPI::Serializer
  attributes :id, :email, :created_at
end

class UserSerializer # rubocop:disable Style/FrozenStringLiteralComment,Style/Documentation
  include JSONAPI::Serializer
  attributes :id, :email, :created_at
end

# frozen_string_literal: true

class UserSerializer # rubocop:disable Style/Documentation
  include JSONAPI::Serializer
  attributes :id, :email, :name
end

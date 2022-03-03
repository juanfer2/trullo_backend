module Resolvers
  class Healt < GraphQL::Schema::Resolver
    def resolve
      :ok
    end
  end
end

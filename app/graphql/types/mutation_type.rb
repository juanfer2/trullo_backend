module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :healt, String, null: false,
      description: "An example field added by the generator"
    def healt
      :ok
    end
  end
end

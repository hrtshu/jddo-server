module Types
  class MutationType < Types::BaseObject
    field :create_note, mutation: Mutations::CreateNote
  end
end

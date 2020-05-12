module Types
  class MutationType < Types::BaseObject
    field :create_note, mutation: Mutations::CreateNote
    field :update_note, mutation: Mutations::UpdateNote
  end
end

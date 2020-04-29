module Types
  class NoteType < Types::BaseObject
    field :id, ID, null: false
    field :subject, String, null: false
    field :body, String, null: false
  end
end

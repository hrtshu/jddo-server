module Types
  class NoteType < Types::BaseObject
    field :id, ID, null: false
    field :subject, String, null: false
    field :body, String, null: false
  end

  # TODO 定義場所はここで良いか？
  class NoteInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :subject, String, required: false
    argument :body, String, required: false
  end
end

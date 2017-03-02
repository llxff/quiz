defmodule Quiz.Word do
  use Quiz.Web, :model

  schema "words" do
    field :name, :string
    field :translation, :string
    field :example, :string
    field :studied, :boolean
    field :last_quiz_id, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :translation, :example])
    |> validate_required([:name, :translation, :example])
  end
end

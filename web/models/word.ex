defmodule Quiz.Word do
  use Quiz.Web, :model

  schema "words" do
    field :name, :string
    field :translation, :string
    field :example, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :translation, :example])
    |> validate_required([:name, :translation, :example])
  end
end

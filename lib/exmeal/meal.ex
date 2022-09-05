defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:description, :calories, :date]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "meals" do
    field :description, :string
    field :calories, :integer
    field :date, :date

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end

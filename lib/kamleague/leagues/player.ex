defmodule Kamleague.Leagues.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :nickname, :string
    field :elo, :integer, default: 1000
    field :active, :boolean, default: false
    belongs_to :user, Kamleague.Accounts.User
    has_many :players_games, Kamleague.Leagues.PlayersGames

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:nickname])
    |> validate_required([:nickname])
    |> unique_constraint(:nickname)
  end
end

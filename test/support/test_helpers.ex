defmodule Rumbl.TestHelpers do
  alias Rumbl.Repo
  alias Rumbl.Accounts.User
  alias Rumbl.Assets.Category
  # alias Rumbl.Assets.Video

  def insert_user(attrs \\ %{}) do
    changes =
      Dict.merge(
        %{
          name: "Some User",
          username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}",
          password: "supersecret"
        },
        attrs
      )

    %User{}
    |> User.registration_changeset(changes)
    |> Repo.insert!()
  end

  def insert_video(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:videos, attrs)
    # |> Video.changeset(attrs)
    |> Repo.insert!()
  end

  def insert_category(name \\ "Some Category") do
    %Category{}
    |> Category.changeset(%{name: name})
    |> Repo.insert!()
  end
end

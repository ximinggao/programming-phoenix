defmodule RumblWeb.WatchController do
  use RumblWeb, :controller

  alias Rumbl.Assets.Video
  alias Rumbl.Repo

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)

    render(conn, "show.html", video: video)
  end
end

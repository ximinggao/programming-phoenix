defmodule RumblWeb.VideoViewTest do
  use RumblWeb.ConnCase, async: true
  import Phoenix.View
  alias Rumbl.Assets.Video
  alias Rumbl.Assets.Category

  setup do
    {:ok, conn: build_conn(), category: %Category{name: "Test"}}
  end

  test "renders index.html", %{conn: conn, category: category} do
    videos = [%Video{id: 1, title: "dogs", category: category}, %Video{id: 2, title: "cats", category: category}]
    content = render_to_string(RumblWeb.VideoView, "index.html", conn: conn, videos: videos)
    assert String.contains?(content, "Listing Videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = Video.changeset(%Video{})
    categories = [{"cats", 123}]
    content = render_to_string(RumblWeb.VideoView, "new.html", conn: conn, changeset: changeset, categories: categories)
    assert String.contains?(content, "New Video")
  end
end

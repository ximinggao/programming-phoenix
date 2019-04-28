defmodule Rumbl.AssetsTest do
  use Rumbl.DataCase

  alias Rumbl.Assets

  describe "videos" do
    alias Rumbl.Assets.Video

    @valid_attrs %{description: "some description", title: "some title", url: "some url"}
    @update_attrs %{
      description: "some updated description",
      title: "some updated title",
      url: "some updated url"
    }
    @invalid_attrs %{description: nil, title: nil, url: nil}

    def video_fixture(attrs \\ %{}) do
      {:ok, video} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assets.create_video()

      video
    end

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Assets.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Assets.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      assert {:ok, %Video{} = video} = Assets.create_video(@valid_attrs)
      assert video.description == "some description"
      assert video.title == "some title"
      assert video.url == "some url"
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assets.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      assert {:ok, %Video{} = video} = Assets.update_video(video, @update_attrs)
      assert video.description == "some updated description"
      assert video.title == "some updated title"
      assert video.url == "some updated url"
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Assets.update_video(video, @invalid_attrs)
      assert video == Assets.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Assets.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Assets.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Assets.change_video(video)
    end
  end
end

defmodule LiveAppWeb.NewsControllerTest do
  use LiveAppWeb.ConnCase

  alias LiveApp.Auth

  @create_attrs %{content: "some content", title: "some title"}
  @update_attrs %{content: "some updated content", title: "some updated title"}
  @invalid_attrs %{content: nil, title: nil}

  def fixture(:news) do
    {:ok, news} = Auth.create_news(@create_attrs)
    news
  end

  describe "index" do
    test "lists all news", %{conn: conn} do
      conn = get(conn, Routes.news_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing News"
    end
  end

  describe "new news" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.news_path(conn, :new))
      assert html_response(conn, 200) =~ "New News"
    end
  end

  describe "create news" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.news_path(conn, :create), news: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.news_path(conn, :show, id)

      conn = get(conn, Routes.news_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show News"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.news_path(conn, :create), news: @invalid_attrs)
      assert html_response(conn, 200) =~ "New News"
    end
  end

  describe "edit news" do
    setup [:create_news]

    test "renders form for editing chosen news", %{conn: conn, news: news} do
      conn = get(conn, Routes.news_path(conn, :edit, news))
      assert html_response(conn, 200) =~ "Edit News"
    end
  end

  describe "update news" do
    setup [:create_news]

    test "redirects when data is valid", %{conn: conn, news: news} do
      conn = put(conn, Routes.news_path(conn, :update, news), news: @update_attrs)
      assert redirected_to(conn) == Routes.news_path(conn, :show, news)

      conn = get(conn, Routes.news_path(conn, :show, news))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, news: news} do
      conn = put(conn, Routes.news_path(conn, :update, news), news: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit News"
    end
  end

  describe "delete news" do
    setup [:create_news]

    test "deletes chosen news", %{conn: conn, news: news} do
      conn = delete(conn, Routes.news_path(conn, :delete, news))
      assert redirected_to(conn) == Routes.news_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.news_path(conn, :show, news))
      end
    end
  end

  defp create_news(_) do
    news = fixture(:news)
    %{news: news}
  end
end

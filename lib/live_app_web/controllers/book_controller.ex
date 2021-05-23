defmodule LiveAppWeb.BookController do
  use LiveAppWeb, :controller

  alias LiveApp.Garden
  alias LiveApp.Garden.Book

  def index(conn, params) do
    # books = Garden.list_books(params)
    page = Garden.list_books(params)
    render(conn, "index.html", books: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = Garden.change_book(%Book{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"book" => book_params}) do
    case Garden.create_book(book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Garden.get_book!(id)
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"id" => id}) do
    book = Garden.get_book!(id)
    changeset = Garden.change_book(book)
    render(conn, "edit.html", book: book, changeset: changeset)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Garden.get_book!(id)

    case Garden.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", book: book, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Garden.get_book!(id)
    {:ok, _book} = Garden.delete_book(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: Routes.book_path(conn, :index))
  end
end

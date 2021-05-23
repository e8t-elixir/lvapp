defmodule LiveApp.GardenTest do
  use LiveApp.DataCase

  alias LiveApp.Garden

  describe "books" do
    alias LiveApp.Garden.Book

    @valid_attrs %{info: "some info", isbn: "some isbn", title: "some title", view_count: 42}
    @update_attrs %{info: "some updated info", isbn: "some updated isbn", title: "some updated title", view_count: 43}
    @invalid_attrs %{info: nil, isbn: nil, title: nil, view_count: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Garden.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Garden.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Garden.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Garden.create_book(@valid_attrs)
      assert book.info == "some info"
      assert book.isbn == "some isbn"
      assert book.title == "some title"
      assert book.view_count == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Garden.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Garden.update_book(book, @update_attrs)
      assert book.info == "some updated info"
      assert book.isbn == "some updated isbn"
      assert book.title == "some updated title"
      assert book.view_count == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Garden.update_book(book, @invalid_attrs)
      assert book == Garden.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Garden.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Garden.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Garden.change_book(book)
    end
  end
end

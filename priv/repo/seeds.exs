# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveApp.Repo.insert!(%LiveApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LiveApp.Garden

if Mix.env() == :dev do
  Enum.map(2..100, fn x ->
    Garden.create_book(%{
      info: "Info Book #{x}",
      isbn: "aaa-bbb-ccc-#{x}",
      title: "Book Title #{x}",
      view_count: Enum.random(10..200)
    })
  end)
end

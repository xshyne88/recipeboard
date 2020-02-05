defmodule Recipeboard.Factory do
  use ExMachina.Ecto, repo: Recipeboard.Repo

  def user_factory do
    %Recipeboard.Accounts.User{
      name: Faker.Name.name(),
      email: Faker.Company.bullshit() <> "@gmail.com",
      admin: true
    }
  end
end

defmodule Scriptdrop.Repo.Migrations.AddMissingFkAndUniques do
  use Ecto.Migration

  def change do
    alter table(:orders) do
       remove :status
       add :status, references(:orderstatuses)
    end
  end
end

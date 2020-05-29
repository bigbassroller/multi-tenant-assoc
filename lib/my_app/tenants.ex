defmodule MyApp.Tenants do
  @moduledoc """
  The Tenants context.
  """

  import Ecto.Query, warn: false
  alias MyApp.Repo

  def list do
    Triplex.all Repo
  end

  def new(name) when is_bitstring(name) do
    if Triplex.exists? name, Repo do
      {:error, :tenant_exists}
    else
      Triplex.create name, Repo
    end
  end

  def remove(name) when is_bitstring(name) do
    Triplex.drop  name, Repo
  end

  def rename(current_name, new_name) do
    if Triplex.exists? new_name, Repo do
      {:error, :tenant_exists}
    else
      Triplex.rename current_name, new_name, Repo
    end
  end

end

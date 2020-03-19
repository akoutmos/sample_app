defmodule UserDB do
  use Agent

  def start_link(_) do
    Agent.start_link(
      fn ->
        {%{}, 1}
      end,
      name: __MODULE__
    )
  end

  def add_user(user) do
    Agent.get_and_update(__MODULE__, fn {users_map, next_id} ->
      updated_users_map = Map.put(users_map, next_id, user)

      {Map.put(user, :id, next_id), {updated_users_map, next_id + 1}}
    end)
  end

  def get_user(id) do
    Agent.get(__MODULE__, fn {users_map, _next_id} ->
      Map.get(users_map, id)
    end)
  end
end

defmodule PlanningPoker.Game do

  defstruct estimates: [], players: []

  def agreed?(%PlanningPoker.Game{estimates: [{_, estimate} | other_estimates]}) do
    Enum.all? other_estimates, fn({_, other_estimate}) -> other_estimate == estimate end
  end

  def agreed?(%PlanningPoker.Game{estimates: []}), do: false

  def get_estimate(game = %PlanningPoker.Game{estimates: [{_, estimate} | _ ] }) do
    if agreed?(game), do: estimate
  end

  def estimated?(%PlanningPoker.Game{estimates: estimates, players: players}) do
    Enum.count(players) == Enum.count(estimates)
  end
end

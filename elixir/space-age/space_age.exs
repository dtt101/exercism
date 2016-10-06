defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds = case planet do
      :earth -> seconds
      :mercury -> seconds / 0.2408467
      :venus -> seconds / 0.61519726
      :mars -> seconds / 1.8808158
      :jupiter -> seconds / 11.862615
      :saturn -> seconds / 29.447498
      :uranus -> seconds / 84.016846
      :neptune -> seconds / 164.79132
    end
    seconds / 31557600
  end
end

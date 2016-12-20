defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
      case planet do
        :mercury -> seconds / 31557600 / 0.2408467
        :venus -> seconds / 31557600 / 0.61519726
        :earth -> seconds / 31557600
        :mars -> seconds / 31557600 / 1.8808158
        :jupiter -> seconds / 31557600 / 11.862615
        :saturn -> seconds / 31557600 / 29.447498
        :uranus -> seconds / 31557600 / 84.016846
        :neptune -> seconds / 31557600 / 164.79132
        end
  end
end

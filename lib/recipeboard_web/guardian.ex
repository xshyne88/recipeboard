defmodule RecipeboardWeb.Guardian do
  use Guardian, otp_app: :recipeboard

  def subject_for_token(res, _claims) do
    IO.inspect(res)
    {:ok, res}
  end

  def subject_for_token(_, _) do
    {:error, :notfound}
  end

  @spec resource_from_claims(any) :: {:ok, any}
  def resource_from_claims(res) do
    IO.inspect(res)
    {:ok, res}
  end

  def resource_from_claims(_) do
    {:error, :notfound}
  end
end

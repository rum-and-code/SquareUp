defmodule SquareUp.V2.TerminalCheckouts do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec search(
          SquareUp.Client.t(),
          %{},
          SquareUp.TypeSpecs.search_terminal_checkouts_request(),
          %{}
        ) :: SquareUp.Client.response(SquareUp.TypeSpecs.search_terminal_checkouts_response())
  def search(client, path_params \\ %{}, params \\ %{}, query_params \\ %{}) do
    path_params_spec = schema(%{})
    params_spec = Norm.Delegate.delegate(&SquareUp.NormSchema.search_terminal_checkouts_request/0)
    query_params_spec = schema(%{})

    response_spec = {:delegate, &SquareUp.ResponseSchema.search_terminal_checkouts_response/0}

    call(client, %{
      method: :post,
      path_params: path_params,
      params: params,
      query_params: query_params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      query_params_spec: query_params_spec,
      response_spec: response_spec,
      path: "/v2/terminals/checkouts/search"
    })
  end
end

defmodule LiveModelTest do
  use ExUnit.Case
  doctest LiveModel

  defmodule Model do
    import LiveModel

    defmodel do
      field(:req_str, String.t(), required: true)
      field(:list_of_numbers, [integer()], default: [])
      field(:mymap, map())
    end
  end

  test "new/1 creates a model struct" do
    %Model{} = model = Model.new("Required String")

    assert %Model{req_str: "Required String", list_of_numbers: [], mymap: nil} = model

    %Model{} = model = Model.new("Required String", list_of_numbers: [1, 2, 3])

    assert %Model{req_str: "Required String", list_of_numbers: [1, 2, 3], mymap: nil} = model

    %Model{} = model = Model.new("Required String", mymap: %{a: 1}, unknown_field: [1, 2, 3])

    assert %Model{req_str: "Required String", list_of_numbers: [], mymap: %{a: 1}} = model
  end
end

defmodule NameBadge do
  def print(id, name, department) do
    id_part = if id, do: "[#{id}] - ", else: ""
    department_part = if department, do: String.upcase(department), else: "OWNER"
    id_part <> "#{name} - " <> department_part
  end
end

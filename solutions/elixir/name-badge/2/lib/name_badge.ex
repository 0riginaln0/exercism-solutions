defmodule NameBadge do
  def print(id, name, department) do
    id_label =
      if id do
        "[#{id}] - "
      else
        ""
      end

    name_label = "#{name} - "

    department_label =
      if department do
        "#{String.upcase(department)}"
      else
        "OWNER"
      end

    id_label <> name_label <> department_label
  end
end

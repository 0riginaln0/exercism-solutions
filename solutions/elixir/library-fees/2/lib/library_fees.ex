defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    period_of_use = if before_noon?(checkout_datetime), do: 28, else: 29

    NaiveDateTime.add(checkout_datetime, period_of_use, :day)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    overdue = Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    if overdue >= 0, do: overdue, else: 0
  end

  def monday?(datetime) do
    {day_number, _, _} =
      datetime.calendar.day_of_week(datetime.year, datetime.month, datetime.day, :monday)

    day_number == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_book_return_date = return_date(datetime_from_string(checkout))
    book_return_datetime = datetime_from_string(return)
    overdue = days_late(planned_book_return_date, book_return_datetime)
    if monday?(book_return_datetime), do: trunc(overdue * rate * 0.5), else: overdue * rate
  end
end

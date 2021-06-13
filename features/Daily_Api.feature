# Created by richa.kumari at 06-06-2021
Feature: Verify if the API returns the traded data of daily time series
  # Enter feature description here
  This API returns raw (as-traded) daily time series (date, daily open, daily high, daily low, daily close, daily volume) of the global equity specified, covering 20+ years of historical data. If you are also interested in split/dividend-adjusted historical data, please use the Daily Adjusted API, which covers adjusted close values and historical split and dividend events.

  Scenario Outline: Verify TIME_SERIES_DAILY API functionality

    # Enter steps here
    Given The API param to be posted <function> <symbol> <outputsize> <apikey>
    When We execute the TIME_SERIES_DAILY GET method
    Then Response from the API is verified <responsecode>
    Examples:
    |function           | symbol       | outputsize | apikey           |responsecode|
    |TIME_SERIES_DAILY  | IBM          | compact    | IMG8W99RT7KQ5Y9V |200         |
    |TIME_SERIES_DAILY  | TASCO.LON    | Full       | IMG8W99RT7KQ5Y9V |200         |
    |TIME_SERIES_DAILY  | SHOP.TRT     | compact    | IMG8W99RT7KQ5Y9V |200         |
    |TIME_SERIES_DAILY  | GVP.TRV      | compact    | IMG8W99RT7KQ5Y9V |200         |
    |TIME_SERIES_WEEKLY | ABC          | compact    | abc              |200         |

   Scenario Outline: Verify TIME_SERIES_DAILY API functionality 6th request

    # Enter steps here
    Given The API param to be posted <function> <symbol> <outputsize> <apikey>
    When We execute the TIME_SERIES_DAILY GET method for 6th request
    Then Response from the API is verified for 6th request <responsecode>
    Examples:
    |function           | symbol       | outputsize | apikey           |responsecode|
    |TIME_SERIES_DAILY  | GVP.TRV      | compact    | IMG8W99RT7KQ5Y9V |200         |



from behave import *
import requests
import config

api_endpoint = {}
time_series_response_data = {}
response_codes = {}
response_texts = {}
error_message = {}
api_url = config.api_url


@given('The API param to be posted {function} {symbol} {outputsize} {apikey}')
def step_impl(context, function, symbol, outputsize, apikey):
    global api_endpoint
    api_endpoint['GET_URL'] = (api_url + "function=" + function + "&" + "symbol=" + symbol + "&" +
                               "outputsize=" + outputsize + "&" + "apikey=" + apikey)
    print('url to which the request is to be posted is  :', api_endpoint['GET_URL'])


@when('We execute the TIME_SERIES_DAILY GET method')
def step_impl(context):
    time_series_response = requests.get(url=api_endpoint['GET_URL'])
    # extracting response text
    response_texts['GET'] = time_series_response.text
    # extracting response status_code
    statuscode = time_series_response.status_code
    response_codes['GET'] = statuscode
    time_series_response_data = time_series_response.json()
    time_series_response_data['Note'] = error_message
    print ("the response after the Throttle limit has passed ",time_series_response_data['Note'])


@then('Response from the API is verified {responsecode}')
def step_impl(context, responsecode):
    print("Get response code is : ", response_codes['GET'],responsecode)
    assert str(response_codes['GET']) == responsecode
    print(time_series_response_data)
    # if str(time_series_response_data['Note']) is not None:
    #     print(str(time_series_response_data['Note']))
    #     assert time_series_response_data[
    #            'Note'] == 'Thank you for using Alpha Vantage! Our standard API call frequency is 5 calls per minute and 500 calls per day. Please visit https://www.alphavantage.co/premium/ if you would like to target a higher API call frequency.'



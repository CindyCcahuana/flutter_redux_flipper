const Map<String, dynamic> updateSubscriptionMock = {
  "id": "2c938084726fca480172750000000000",
  "version": 0,
  "application_id": 1234567812345678,
  "collector_id": 100200300,
  "preapproval_plan_id": "2c938084726fca480172750000000000",
  "reason": "Yoga classes.",
  "external_reference": 23546246234,
  "back_url": "https://www.mercadopago.com.ar",
  "init_point":
      "https://www.mercadopago.com.ar/subscriptions/checkout?preapproval_id=2c938084726fca480172750000000000",
  "auto_recurring": {
    "frequency": 1,
    "frequency_type": "months",
    "start_date": "2020-06-02T13:07:14.260Z",
    "end_date": "2022-07-20T15:59:52.581Z",
    "currency_id": "ARS",
    "transaction_amount": 10,
    "free_trial": {"frequency": 1, "frequency_type": "months"}
  },
  "first_invoice_offset": 7,
  "payer_id": 123123123,
  "card_id": 123123123,
  "payment_method_id": "account_money",
  "next_payment_date": "2022-01-01T11:12:25.892-04:00",
  "date_created": "2022-01-01T11:12:25.892-04:00",
  "last_modified": "2022-01-01T11:12:25.892-04:00",
  "summarized": {
    "quotas": 6,
    "charged_quantity": 3,
    "charged_amount": 1000,
    "pending_charge_quantity": 1,
    "pending_charge_amount": 200,
    "last_charged_date": "2022-01-01T11:12:25.892-04:00",
    "last_charged_amount": 100,
    "semaphore": "green"
  },
  "status": "pending"
};

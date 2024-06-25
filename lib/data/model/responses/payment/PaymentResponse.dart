/// status : "success"
/// data : {"id":"cs_test_a1bJPSpvNlMR2YyS1iQWCkW4FstkI3WExrH2iN9Try0us8kHHAc6E04hAE","object":"checkout.session","after_expiration":null,"allow_promotion_codes":null,"amount_subtotal":100000,"amount_total":100000,"automatic_tax":{"enabled":false,"liability":null,"status":null},"billing_address_collection":null,"cancel_url":"http://kartak.onrender.com/api/order","client_reference_id":"7T4K2J-H9N3P-W1B7X8","client_secret":null,"consent":null,"consent_collection":null,"created":1719133747,"currency":"egp","currency_conversion":null,"custom_fields":[],"custom_text":{"after_submit":null,"shipping_address":null,"submit":null,"terms_of_service_acceptance":null},"customer":null,"customer_creation":"if_required","customer_details":{"address":null,"email":"useifmeslhy@gmail.com","name":null,"phone":null,"tax_exempt":"none","tax_ids":null},"customer_email":"useifmeslhy@gmail.com","expires_at":1719220146,"invoice":null,"invoice_creation":{"enabled":false,"invoice_data":{"account_tax_ids":null,"custom_fields":null,"description":null,"footer":null,"issuer":null,"metadata":{},"rendering_options":null}},"livemode":false,"locale":null,"metadata":{},"mode":"payment","payment_intent":null,"payment_link":null,"payment_method_collection":"if_required","payment_method_configuration_details":{"id":"pmc_1PKmasH0IrZrduSRbOnGU54p","parent":null},"payment_method_options":{"card":{"request_three_d_secure":"automatic"}},"payment_method_types":["card","link"],"payment_status":"unpaid","phone_number_collection":{"enabled":false},"recovered_from":null,"saved_payment_method_options":null,"setup_intent":null,"shipping_address_collection":null,"shipping_cost":null,"shipping_details":null,"shipping_options":[],"status":"open","submit_type":null,"subscription":null,"success_url":"http://kartak.onrender.com/api/place","total_details":{"amount_discount":0,"amount_shipping":0,"amount_tax":0},"ui_mode":"hosted","url":"https://checkout.stripe.com/c/pay/cs_test_a1bJPSpvNlMR2YyS1iQWCkW4FstkI3WExrH2iN9Try0us8kHHAc6E04hAE#fidkdWxOYHwnPyd1blpxYHZxWjA0VU5oMXdNNUx3X3dhcFZXa25gNmlQckdCZFxUNUMwcU5jbz12T0RXT1BGTWRQc2tQPHZsd19pZ243T1JKU1FdUzBga0tuN2ZyXEtSQXxvQm58V2FxbFBGNTVLQTJsYXxrfScpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl"}

class PaymentResponse {
  PaymentResponse({
      this.status, 
      this.data,});

  PaymentResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? PaymentData.fromJson(json['data']) : null;
  }
  String? status;
  PaymentData? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : "cs_test_a1bJPSpvNlMR2YyS1iQWCkW4FstkI3WExrH2iN9Try0us8kHHAc6E04hAE"
/// object : "checkout.session"
/// after_expiration : null
/// allow_promotion_codes : null
/// amount_subtotal : 100000
/// amount_total : 100000
/// automatic_tax : {"enabled":false,"liability":null,"status":null}
/// billing_address_collection : null
/// cancel_url : "http://kartak.onrender.com/api/order"
/// client_reference_id : "7T4K2J-H9N3P-W1B7X8"
/// client_secret : null
/// consent : null
/// consent_collection : null
/// created : 1719133747
/// currency : "egp"
/// currency_conversion : null
/// custom_fields : []
/// custom_text : {"after_submit":null,"shipping_address":null,"submit":null,"terms_of_service_acceptance":null}
/// customer : null
/// customer_creation : "if_required"
/// customer_details : {"address":null,"email":"useifmeslhy@gmail.com","name":null,"phone":null,"tax_exempt":"none","tax_ids":null}
/// customer_email : "useifmeslhy@gmail.com"
/// expires_at : 1719220146
/// invoice : null
/// invoice_creation : {"enabled":false,"invoice_data":{"account_tax_ids":null,"custom_fields":null,"description":null,"footer":null,"issuer":null,"metadata":{},"rendering_options":null}}
/// livemode : false
/// locale : null
/// metadata : {}
/// mode : "payment"
/// payment_intent : null
/// payment_link : null
/// payment_method_collection : "if_required"
/// payment_method_configuration_details : {"id":"pmc_1PKmasH0IrZrduSRbOnGU54p","parent":null}
/// payment_method_options : {"card":{"request_three_d_secure":"automatic"}}
/// payment_method_types : ["card","link"]
/// payment_status : "unpaid"
/// phone_number_collection : {"enabled":false}
/// recovered_from : null
/// saved_payment_method_options : null
/// setup_intent : null
/// shipping_address_collection : null
/// shipping_cost : null
/// shipping_details : null
/// shipping_options : []
/// status : "open"
/// submit_type : null
/// subscription : null
/// success_url : "http://kartak.onrender.com/api/place"
/// total_details : {"amount_discount":0,"amount_shipping":0,"amount_tax":0}
/// ui_mode : "hosted"
/// url : "https://checkout.stripe.com/c/pay/cs_test_a1bJPSpvNlMR2YyS1iQWCkW4FstkI3WExrH2iN9Try0us8kHHAc6E04hAE#fidkdWxOYHwnPyd1blpxYHZxWjA0VU5oMXdNNUx3X3dhcFZXa25gNmlQckdCZFxUNUMwcU5jbz12T0RXT1BGTWRQc2tQPHZsd19pZ243T1JKU1FdUzBga0tuN2ZyXEtSQXxvQm58V2FxbFBGNTVLQTJsYXxrfScpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl"

class PaymentData {
  PaymentData({
      this.id, 
      this.object, 
      this.afterExpiration, 
      this.allowPromotionCodes, 
      this.amountSubtotal, 
      this.amountTotal, 
      this.automaticTax, 
      this.billingAddressCollection, 
      this.cancelUrl, 
      this.clientReferenceId, 
      this.clientSecret, 
      this.consent, 
      this.consentCollection, 
      this.created, 
      this.currency, 
      this.currencyConversion, 
      this.customFields, 
      this.customText, 
      this.customer, 
      this.customerCreation, 
      this.customerDetails, 
      this.customerEmail, 
      this.expiresAt, 
      this.invoice, 
      this.invoiceCreation, 
      this.livemode, 
      this.locale, 
      this.metadata, 
      this.mode, 
      this.paymentIntent, 
      this.paymentLink, 
      this.paymentMethodCollection, 
      this.paymentMethodConfigurationDetails, 
      this.paymentMethodOptions, 
      this.paymentMethodTypes, 
      this.paymentStatus, 
      this.phoneNumberCollection, 
      this.recoveredFrom, 
      this.savedPaymentMethodOptions, 
      this.setupIntent, 
      this.shippingAddressCollection, 
      this.shippingCost, 
      this.shippingDetails, 
      this.shippingOptions, 
      this.status, 
      this.submitType, 
      this.subscription, 
      this.successUrl, 
      this.totalDetails, 
      this.uiMode, 
      this.url,});

  PaymentData.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    afterExpiration = json['after_expiration'];
    allowPromotionCodes = json['allow_promotion_codes'];
    amountSubtotal = json['amount_subtotal'];
    amountTotal = json['amount_total'];
    automaticTax = json['automatic_tax'] != null ? AutomaticTax.fromJson(json['automatic_tax']) : null;
    billingAddressCollection = json['billing_address_collection'];
    cancelUrl = json['cancel_url'];
    clientReferenceId = json['client_reference_id'];
    clientSecret = json['client_secret'];
    consent = json['consent'];
    consentCollection = json['consent_collection'];
    created = json['created'];
    currency = json['currency'];
    currencyConversion = json['currency_conversion'];
    customText = json['custom_text'] != null ? CustomText.fromJson(json['custom_text']) : null;
    customer = json['customer'];
    customerCreation = json['customer_creation'];
    customerDetails = json['customer_details'] != null ? CustomerDetails.fromJson(json['customer_details']) : null;
    customerEmail = json['customer_email'];
    expiresAt = json['expires_at'];
    invoice = json['invoice'];
    invoiceCreation = json['invoice_creation'] != null ? InvoiceCreation.fromJson(json['invoice_creation']) : null;
    livemode = json['livemode'];
    locale = json['locale'];
    metadata = json['metadata'];
    mode = json['mode'];
    paymentIntent = json['payment_intent'];
    paymentLink = json['payment_link'];
    paymentMethodCollection = json['payment_method_collection'];
    paymentMethodConfigurationDetails = json['payment_method_configuration_details'] != null ? PaymentMethodConfigurationDetails.fromJson(json['payment_method_configuration_details']) : null;
    paymentMethodOptions = json['payment_method_options'] != null ? PaymentMethodOptions.fromJson(json['payment_method_options']) : null;
    paymentMethodTypes = json['payment_method_types'] != null ? json['payment_method_types'].cast<String>() : [];
    paymentStatus = json['payment_status'];
    phoneNumberCollection = json['phone_number_collection'] != null ? PhoneNumberCollection.fromJson(json['phone_number_collection']) : null;
    recoveredFrom = json['recovered_from'];
    savedPaymentMethodOptions = json['saved_payment_method_options'];
    setupIntent = json['setup_intent'];
    shippingAddressCollection = json['shipping_address_collection'];
    shippingCost = json['shipping_cost'];
    shippingDetails = json['shipping_details'];
    status = json['status'];
    submitType = json['submit_type'];
    subscription = json['subscription'];
    successUrl = json['success_url'];
    totalDetails = json['total_details'] != null ? TotalDetails.fromJson(json['total_details']) : null;
    uiMode = json['ui_mode'];
    url = json['url'];
  }
  String? id;
  String? object;
  dynamic afterExpiration;
  dynamic allowPromotionCodes;
  int? amountSubtotal;
  int? amountTotal;
  AutomaticTax? automaticTax;
  dynamic billingAddressCollection;
  String? cancelUrl;
  String? clientReferenceId;
  dynamic clientSecret;
  dynamic consent;
  dynamic consentCollection;
  int? created;
  String? currency;
  dynamic currencyConversion;
  List<dynamic>? customFields;
  CustomText? customText;
  dynamic customer;
  String? customerCreation;
  CustomerDetails? customerDetails;
  String? customerEmail;
  int? expiresAt;
  dynamic invoice;
  InvoiceCreation? invoiceCreation;
  bool? livemode;
  dynamic locale;
  dynamic metadata;
  String? mode;
  dynamic paymentIntent;
  dynamic paymentLink;
  String? paymentMethodCollection;
  PaymentMethodConfigurationDetails? paymentMethodConfigurationDetails;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  String? paymentStatus;
  PhoneNumberCollection? phoneNumberCollection;
  dynamic recoveredFrom;
  dynamic savedPaymentMethodOptions;
  dynamic setupIntent;
  dynamic shippingAddressCollection;
  dynamic shippingCost;
  dynamic shippingDetails;
  List<dynamic>? shippingOptions;
  String? status;
  dynamic submitType;
  dynamic subscription;
  String? successUrl;
  TotalDetails? totalDetails;
  String? uiMode;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    map['after_expiration'] = afterExpiration;
    map['allow_promotion_codes'] = allowPromotionCodes;
    map['amount_subtotal'] = amountSubtotal;
    map['amount_total'] = amountTotal;
    if (automaticTax != null) {
      map['automatic_tax'] = automaticTax?.toJson();
    }
    map['billing_address_collection'] = billingAddressCollection;
    map['cancel_url'] = cancelUrl;
    map['client_reference_id'] = clientReferenceId;
    map['client_secret'] = clientSecret;
    map['consent'] = consent;
    map['consent_collection'] = consentCollection;
    map['created'] = created;
    map['currency'] = currency;
    map['currency_conversion'] = currencyConversion;
    if (customFields != null) {
      map['custom_fields'] = customFields?.map((v) => v.toJson()).toList();
    }
    if (customText != null) {
      map['custom_text'] = customText?.toJson();
    }
    map['customer'] = customer;
    map['customer_creation'] = customerCreation;
    if (customerDetails != null) {
      map['customer_details'] = customerDetails?.toJson();
    }
    map['customer_email'] = customerEmail;
    map['expires_at'] = expiresAt;
    map['invoice'] = invoice;
    if (invoiceCreation != null) {
      map['invoice_creation'] = invoiceCreation?.toJson();
    }
    map['livemode'] = livemode;
    map['locale'] = locale;
    map['metadata'] = metadata;
    map['mode'] = mode;
    map['payment_intent'] = paymentIntent;
    map['payment_link'] = paymentLink;
    map['payment_method_collection'] = paymentMethodCollection;
    if (paymentMethodConfigurationDetails != null) {
      map['payment_method_configuration_details'] = paymentMethodConfigurationDetails?.toJson();
    }
    if (paymentMethodOptions != null) {
      map['payment_method_options'] = paymentMethodOptions?.toJson();
    }
    map['payment_method_types'] = paymentMethodTypes;
    map['payment_status'] = paymentStatus;
    if (phoneNumberCollection != null) {
      map['phone_number_collection'] = phoneNumberCollection?.toJson();
    }
    map['recovered_from'] = recoveredFrom;
    map['saved_payment_method_options'] = savedPaymentMethodOptions;
    map['setup_intent'] = setupIntent;
    map['shipping_address_collection'] = shippingAddressCollection;
    map['shipping_cost'] = shippingCost;
    map['shipping_details'] = shippingDetails;
    if (shippingOptions != null) {
      map['shipping_options'] = shippingOptions?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['submit_type'] = submitType;
    map['subscription'] = subscription;
    map['success_url'] = successUrl;
    if (totalDetails != null) {
      map['total_details'] = totalDetails?.toJson();
    }
    map['ui_mode'] = uiMode;
    map['url'] = url;
    return map;
  }

}

/// amount_discount : 0
/// amount_shipping : 0
/// amount_tax : 0

class TotalDetails {
  TotalDetails({
      this.amountDiscount, 
      this.amountShipping, 
      this.amountTax,});

  TotalDetails.fromJson(dynamic json) {
    amountDiscount = json['amount_discount'];
    amountShipping = json['amount_shipping'];
    amountTax = json['amount_tax'];
  }
  int? amountDiscount;
  int? amountShipping;
  int? amountTax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount_discount'] = amountDiscount;
    map['amount_shipping'] = amountShipping;
    map['amount_tax'] = amountTax;
    return map;
  }

}

/// enabled : false

class PhoneNumberCollection {
  PhoneNumberCollection({
      this.enabled,});

  PhoneNumberCollection.fromJson(dynamic json) {
    enabled = json['enabled'];
  }
  bool? enabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enabled'] = enabled;
    return map;
  }

}

/// card : {"request_three_d_secure":"automatic"}

class PaymentMethodOptions {
  PaymentMethodOptions({
      this.card,});

  PaymentMethodOptions.fromJson(dynamic json) {
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
  }
  Card? card;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (card != null) {
      map['card'] = card?.toJson();
    }
    return map;
  }

}

/// request_three_d_secure : "automatic"

class Card {
  Card({
      this.requestThreeDSecure,});

  Card.fromJson(dynamic json) {
    requestThreeDSecure = json['request_three_d_secure'];
  }
  String? requestThreeDSecure;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['request_three_d_secure'] = requestThreeDSecure;
    return map;
  }

}

/// id : "pmc_1PKmasH0IrZrduSRbOnGU54p"
/// parent : null

class PaymentMethodConfigurationDetails {
  PaymentMethodConfigurationDetails({
      this.id, 
      this.parent,});

  PaymentMethodConfigurationDetails.fromJson(dynamic json) {
    id = json['id'];
    parent = json['parent'];
  }
  String? id;
  dynamic parent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['parent'] = parent;
    return map;
  }

}

/// enabled : false
/// invoice_data : {"account_tax_ids":null,"custom_fields":null,"description":null,"footer":null,"issuer":null,"metadata":{},"rendering_options":null}

class InvoiceCreation {
  InvoiceCreation({
      this.enabled, 
      this.invoiceData,});

  InvoiceCreation.fromJson(dynamic json) {
    enabled = json['enabled'];
    invoiceData = json['invoice_data'] != null ? InvoiceData.fromJson(json['invoice_data']) : null;
  }
  bool? enabled;
  InvoiceData? invoiceData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enabled'] = enabled;
    if (invoiceData != null) {
      map['invoice_data'] = invoiceData?.toJson();
    }
    return map;
  }

}

/// account_tax_ids : null
/// custom_fields : null
/// description : null
/// footer : null
/// issuer : null
/// metadata : {}
/// rendering_options : null

class InvoiceData {
  InvoiceData({
      this.accountTaxIds, 
      this.customFields, 
      this.description, 
      this.footer, 
      this.issuer, 
      this.metadata, 
      this.renderingOptions,});

  InvoiceData.fromJson(dynamic json) {
    accountTaxIds = json['account_tax_ids'];
    customFields = json['custom_fields'];
    description = json['description'];
    footer = json['footer'];
    issuer = json['issuer'];
    metadata = json['metadata'];
    renderingOptions = json['rendering_options'];
  }
  dynamic accountTaxIds;
  dynamic customFields;
  dynamic description;
  dynamic footer;
  dynamic issuer;
  dynamic metadata;
  dynamic renderingOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_tax_ids'] = accountTaxIds;
    map['custom_fields'] = customFields;
    map['description'] = description;
    map['footer'] = footer;
    map['issuer'] = issuer;
    map['metadata'] = metadata;
    map['rendering_options'] = renderingOptions;
    return map;
  }

}

/// address : null
/// email : "useifmeslhy@gmail.com"
/// name : null
/// phone : null
/// tax_exempt : "none"
/// tax_ids : null

class CustomerDetails {
  CustomerDetails({
      this.address, 
      this.email, 
      this.name, 
      this.phone, 
      this.taxExempt, 
      this.taxIds,});

  CustomerDetails.fromJson(dynamic json) {
    address = json['address'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    taxExempt = json['tax_exempt'];
    taxIds = json['tax_ids'];
  }
  dynamic address;
  String? email;
  dynamic name;
  dynamic phone;
  String? taxExempt;
  dynamic taxIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['email'] = email;
    map['name'] = name;
    map['phone'] = phone;
    map['tax_exempt'] = taxExempt;
    map['tax_ids'] = taxIds;
    return map;
  }

}

/// after_submit : null
/// shipping_address : null
/// submit : null
/// terms_of_service_acceptance : null

class CustomText {
  CustomText({
      this.afterSubmit, 
      this.shippingAddress, 
      this.submit, 
      this.termsOfServiceAcceptance,});

  CustomText.fromJson(dynamic json) {
    afterSubmit = json['after_submit'];
    shippingAddress = json['shipping_address'];
    submit = json['submit'];
    termsOfServiceAcceptance = json['terms_of_service_acceptance'];
  }
  dynamic afterSubmit;
  dynamic shippingAddress;
  dynamic submit;
  dynamic termsOfServiceAcceptance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['after_submit'] = afterSubmit;
    map['shipping_address'] = shippingAddress;
    map['submit'] = submit;
    map['terms_of_service_acceptance'] = termsOfServiceAcceptance;
    return map;
  }

}

/// enabled : false
/// liability : null
/// status : null

class AutomaticTax {
  AutomaticTax({
      this.enabled, 
      this.liability, 
      this.status,});

  AutomaticTax.fromJson(dynamic json) {
    enabled = json['enabled'];
    liability = json['liability'];
    status = json['status'];
  }
  bool? enabled;
  dynamic liability;
  dynamic status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enabled'] = enabled;
    map['liability'] = liability;
    map['status'] = status;
    return map;
  }

}
<?php
$idempotent_request_key = uniqid('php');

$invocationContext = new InvocationContext($secretKey, $idempotent_request_key, null);

try{

   // Sample Values For add_funding_account using "BANK"
    $fundingAccount = new FundingAccount();
    $response = $fundingAccount
    -> withDetails("Michael Smith", "Smith", "123450542249", "savings", "082000549", null , null, "personal")
    // withDetails($account_holder_name, $nickname, $account_number, $account_subtype, $aba_routing_number, $card_cvv_number, $expiry_date, $account_holder_type)
    ->forCustomer("36584002") //forCustomer($id_customer) //"1211201" value id_customer, unique identifier assigned by Orbipay to the customer
    ->withAddress(new Address("1551 South Washington Ave", "Suite 130 Piscataway", "Piscataway", "NJ", "USA", "12345", "1234")) 
    // Address($address_line1, $address_line2, $address_city, $address_state, $address_country, $address_zip1, $address_zip2)
    ->withCustomFields(null) // Please contact support@billerpayments.com for more information on configuring and using custom fields.
    ->withMemo("funding account comments") // withMemo($comments)
    ->forClient($clientKey) //forClient($client_key)
    ->createdBy("36584002", $requestorType)  // createdBy($requestor, $requestor_type)
    ->videChannel($channel) // videChannel($channel)
    ->create($invocationContext, $liveMode); // create(InvocationContext $invocationContext, $liveMode = null,  $apiEndPoint = null)
        
    $serializedObject=ObjectSerializer::sanitizeForSerialization($response);
    $encodedString = json_encode($serializedObject);
    
    echo 'API Call Success.'. PHP_EOL;
    echo 'Json Response From SDk:'. PHP_EOL;
    echo $encodedString;
    
} catch (\Orbipay\PaymentsApi\Client\OrbipayApiException $exception) {
    echo 'API Call Failed.'. PHP_EOL;
    
    if($exception->isTimedOut()){
        echo 'TimedOut Happen'. PHP_EOL;
        echo 'Message: ' . $exception->getMessage(). PHP_EOL;    
    }
    else{
        echo 'Message: ' . $exception->getMessage(). PHP_EOL;
        echo 'Http Status Code: ' . $exception->getHttpStatusCode(). PHP_EOL;

        if($exception->getInvocationContext() != null){
             echo "reu_uuid: ".$exception->getInvocationContext()->getRequestUuid(). PHP_EOL;
        }
        
        $errorResponse = $exception->getErrorResponse();
        if($errorResponse != null){
            echo "Error Response: ". PHP_EOL;
            $errors = $errorResponse->getErrors();
            foreach ($errors as $error){
                echo "============================". PHP_EOL;
                echo 'code: ' . $error->getCode(). PHP_EOL;
                echo 'error_message: ' . $error->getMessage(). PHP_EOL;
                echo 'field: ' . $error->getField(). PHP_EOL;
                echo "============================". PHP_EOL;
            }
        }

    }
    
}catch (Exception $exception) {
    echo $exception;
    echo $exception->getTraceAsString();
}

?>
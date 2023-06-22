
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://demo.trainingzone.in/api/user/me',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_POSTFIELDS =>'{"email":"ajay121@mail.com","password":"Test@123"}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json',
    'Accept: application/json',
    'Authorization: Bearer 35|6rgCG3BygX8TH9OOpIk3xSItTeLWl5tfm3BbyUPH'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;